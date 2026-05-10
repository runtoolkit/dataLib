# ─────────────────────────────────────────────────────────────────
# datalib:core/dispatch/exec [MACRO]
# THE ONLY file in AME that executes $function $(func).
# Do NOT call directly — use #macro:internal/dispatch.
#
# INPUT (datalib:engine._dispatch): func → fully-qualified function name
# ─────────────────────────────────────────────────────────────────
$function $(func)
