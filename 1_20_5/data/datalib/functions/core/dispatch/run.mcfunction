# ─────────────────────────────────────────────────────────────────
# datalib:core/dispatch/run
# Central function dispatch gateway — called via #datalib:internal/dispatch.
# Reads func from datalib:engine._dispatch and calls exec via macro.
# ─────────────────────────────────────────────────────────────────
function datalib:core/dispatch/exec with storage datalib:engine _dispatch
