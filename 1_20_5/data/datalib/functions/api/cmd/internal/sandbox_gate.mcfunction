# datalib:api/cmd/internal/sandbox_gate [1.20.5 overlay]
# Allowlist-aware sandbox gate for cmd/ functions.
#
# Returns 1 → command is allowlisted — execution continues.
# Returns 0 → command is blocked + player kicked — execution halts.
#
# Requires: datalib:engine _sandbox_cmd to be set by caller.
function datalib:api/cmd/internal/sandbox_gate_macro with storage datalib:engine {}
