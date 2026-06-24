# ─────────────────────────────────────────────────────────────────
# datalib:core/dispatch/exec [MACRO]
# THE ONLY file in dataLib that executes $function $(func).
# Do NOT call directly — use #datalib:internal/dispatch.
#
# INPUT (datalib:engine._dispatch): func → fully-qualified function name
# ─────────────────────────────────────────────────────────────────
$function $(func)
