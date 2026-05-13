#!/usr/bin/env bash
set -euo pipefail

# ── JSON validation ───────────────────────────────────────────────────────────
echo "Checking JSON..."
sudo apt-get update -q
sudo apt-get install -y -q jq
find . -name "*.json" -not -path "./.git/*" -print0 | xargs -0 -n1 jq empty

# ── mcfunction pre-check (BOM / null bytes / CRLF) ───────────────────────────
echo "Scanning .mcfunction files..."
FILES=$(find . -name "*.mcfunction" -not -path "./.git/*")

if [ -z "$FILES" ]; then
  echo "No .mcfunction files found."
else
  ERRORS=0
  while IFS= read -r file; do
    if head -c 3 "$file" | grep -qP '^\xef\xbb\xbf'; then
      echo "BOM detected: $file"
      ERRORS=$((ERRORS + 1))
    fi
    if grep -Pql '\x00' "$file"; then
      echo "Null byte detected: $file"
      ERRORS=$((ERRORS + 1))
    fi
    if file "$file" | grep -q "CRLF"; then
      echo "CRLF line endings: $file"
      ERRORS=$((ERRORS + 1))
    fi
  done <<< "$FILES"

  if [ "$ERRORS" -gt 0 ]; then
    echo "$ERRORS issue(s) found in .mcfunction files."
    exit 1
  fi
  echo "Pre-check passed."
fi

# ── Install mecha ─────────────────────────────────────────────────────────────
pip install git+https://github.com/mcbeet/mecha.git --break-system-packages -q

# ── Patch mecha compat (runner copy only, source files untouched) ─────────────
# 1. "namespace: path" — space after colon in storage targets
find . -name "*.mcfunction" -not -path "./.git/*" \
  -exec grep -lP '[\w.-]+: _' {} \; | \
  xargs --no-run-if-empty sed -i -E 's/([a-z0-9._-]+): _/\1:_/g'

# 2. "time of <dimension> query" — 26.1 dimension-scoped time command
find . -name "*.mcfunction" -not -path "./.git/*" \
  -exec grep -l 'time of ' {} \; | \
  xargs --no-run-if-empty sed -i -E 's/time of [a-z0-9_:.-]+ /time /g'

# 3. "time query day repetition" — 26.1 new subcommand
find . -name "*.mcfunction" -not -path "./.git/*" \
  -exec grep -l 'time query day repetition' {} \; | \
  xargs --no-run-if-empty sed -i 's/time query day repetition/time query daytime/g'

# ── mecha syntax validation ───────────────────────────────────────────────────
mecha .

# ── pack.mcmeta check ─────────────────────────────────────────────────────────
if [ ! -f pack.mcmeta ]; then
  echo "pack.mcmeta is missing!"
  exit 1
fi

echo "All checks passed."