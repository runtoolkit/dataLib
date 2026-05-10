# datalib:api/cmd/internal/sandbox_gate
# Allowlist-aware sandbox gate for cmd/ functions.
# Called by sandbox-guarded cmd/ files instead of the old sandbox_blocked pattern.
#
# Returns 1 → command is allowlisted — execution continues.
# Returns 0 → command is blocked + player kicked — execution halts.
#
# Requires: datalib:engine _sandbox_cmd to be set by caller.
# Caller pattern:
#   execute if data storage datalib:engine {sandbox:1b} run data modify storage datalib:engine _sandbox_cmd set value "cmdname"
#   execute if data storage datalib:engine {sandbox:1b} run execute unless function datalib:api/cmd/internal/sandbox_gate run return 0
function datalib:api/cmd/internal/sandbox_gate_macro with storage datalib:engine {}
