import re, sys, os, json

changed_files_raw = os.environ.get("CHANGED_FILES", "")
mcf_files = [
    f.strip() for f in changed_files_raw.splitlines()
    if f.strip().endswith(".mcfunction") and os.path.isfile(f.strip())
]

PATTERNS = [
    # Privilege escalation
    ("OP_GRANT",             r'(?<!#)\bop\s+(@[ase]|@p|\$)',                           "CRITICAL", "Grants operator to players"),
    ("OP_GRANT_NAME",        r'(?<!#)\bop\s+(?!#)\S+',                                 "CRITICAL", "Grants operator by name"),
    ("DEOP",                 r'(?<!#)\bdeop\s+(@[ase]|@p|\$)',                          "HIGH",     "Removes operator status"),
    ("WHITELIST_ADD",        r'(?<!#)\bwhitelist\s+add\b',                              "HIGH",     "Modifies whitelist"),
    ("WHITELIST_OFF",        r'(?<!#)\bwhitelist\s+off\b',                              "HIGH",     "Disables whitelist entirely"),
    ("BAN",                  r'(?<!#)\bban\s+(?!-ip)\S+',                               "HIGH",     "Bans a player"),
    ("BAN_IP",               r'(?<!#)\bban-ip\s+\S+',                                   "HIGH",     "Bans an IP"),
    ("PARDON",               r'(?<!#)\bpardon\b',                                        "MEDIUM",   "Unbans a player"),

    # Server control
    ("STOP",                 r'(?<!#)\bstop\b',                                          "CRITICAL", "Stops the server"),
    ("SAVE_OFF",             r'(?<!#)\bsave-off\b',                                      "HIGH",     "Disables world saving"),

    # Lag abuse
    ("FORCELOAD_FLOOD",      r'(?<!#)\bforceload\s+add\b.+\bforceload\s+add\b',         "MEDIUM",   "Multiple forceload adds on one line"),

    # Storage poisoning
    ("DATA_REMOVE_ENGINE",   r'(?<!#)\bdata\s+remove\s+storage\s+datalib:engine\b',     "CRITICAL", "Removes engine storage"),

    # Suspicious URLs
    ("URL_HTTP",             r'(?<!#).+"url"\s*:\s*"http://',                           "HIGH",     "Unencrypted HTTP URL in click_event"),
    ("URL_SUSPICIOUS",       r'(?<!#).+"url"\s*:\s*"https?://(?!github\.com|modrinth\.com|curseforge\.com|minecraft\.net|mojang\.com|discord\.gg|discord\.com)',
                                                                                         "MEDIUM",   "URL to non-whitelisted domain"),

    # Macro injection
    ("MACRO_CHAIN",          r'(?<!#)\$.*\$\(',                                          "HIGH",     "Nested macro expansion (injection risk)"),
    ("MACRO_STORAGE_INJECT", r'(?<!#)\$function\s+\$\(',                                 "CRITICAL", "Macro-expanded function path (injection)"),

    # Attribution tampering
    ("RT_ORIGIN_REMOVE",     r'(?<!#)\bdata\s+remove\s+storage\s+datalib:engine\s+global\.rt_origin_verified\b',
                                                                                         "HIGH",     "Removes attribution verification flag"),
]

results = []
total_critical = total_high = total_medium = 0

for fpath in mcf_files:
    try:
        with open(fpath, encoding="utf-8") as f:
            lines = f.readlines()
    except Exception as e:
        results.append({"file": fpath, "error": str(e)})
        continue

    file_hits = []
    for lineno, line in enumerate(lines, 1):
        stripped = line.strip()
        if stripped.startswith("#"):
            continue
        for label, pattern, severity, desc in PATTERNS:
            if re.search(pattern, stripped, re.IGNORECASE):
                file_hits.append({
                    "line": lineno, "label": label,
                    "severity": severity, "desc": desc,
                    "content": stripped[:120]
                })
                if severity == "CRITICAL": total_critical += 1
                elif severity == "HIGH":   total_high += 1
                elif severity == "MEDIUM": total_medium += 1

    if file_hits:
        results.append({"file": fpath, "hits": file_hits})

if not results:
    print("SCAN_PASSED")
    with open(os.environ["GITHUB_OUTPUT"], "a") as f:
        f.write("critical=0\nhigh=0\nmedium=0\n")
    sys.exit(0)

report_lines = [
    "## ⚠️ PR Security Scan — Issues Found",
    "",
    "| Severity | Count |",
    "|----------|-------|",
    f"| 🔴 CRITICAL | {total_critical} |",
    f"| 🟠 HIGH     | {total_high} |",
    f"| 🟡 MEDIUM   | {total_medium} |",
    "",
]

for entry in results:
    if "error" in entry:
        report_lines.append(f"### ❌ `{entry['file']}` — read error: {entry['error']}")
        continue
    report_lines.append(f"### `{entry['file']}`")
    for hit in entry["hits"]:
        icon = {"CRITICAL": "🔴", "HIGH": "🟠", "MEDIUM": "🟡"}.get(hit["severity"], "⚪")
        report_lines.append(f"- {icon} **{hit['severity']}** `{hit['label']}` (line {hit['line']}): {hit['desc']}")
        report_lines.append(f"  ```")
        report_lines.append(f"  {hit['content']}")
        report_lines.append(f"  ```")
    report_lines.append("")

report_lines += [
    "> **This scan is automated.** MEDIUM findings may be false positives.",
    "> CRITICAL and HIGH findings must be reviewed before merge.",
]

report = "\n".join(report_lines)

with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as f:
    f.write(report + "\n")

with open("/tmp/scan_report.md", "w") as f:
    f.write(report)

with open(os.environ["GITHUB_OUTPUT"], "a") as f:
    f.write(f"critical={total_critical}\nhigh={total_high}\nmedium={total_medium}\n")

if total_critical > 0 or total_high > 0:
    print("SCAN_FAILED")
    sys.exit(1)

print("SCAN_WARNED")
sys.exit(0)
