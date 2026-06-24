# datalib:api/cmd/internal/sandbox_blocked [1.20.3 overlay]
# Called by cmd/ files when datalib:engine {sandbox:1b} is set.
# Reads datalib:engine _sandbox_cmd (set by the caller before this call).
# Passes the entire datalib:engine storage as macro input so that
# sandbox_blocked_macro can read $(_sandbox_cmd) directly.
#
# test_block server logging (added in 25w03a / 1.21.5) is NOT available
# on this version — only the in-game log buffer is used.
function datalib:api/cmd/internal/sandbox_blocked_macro with storage datalib:engine {}
