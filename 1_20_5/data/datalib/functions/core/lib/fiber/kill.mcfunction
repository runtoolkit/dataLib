# ─────────────────────────────────────────────────────────────────
# datalib:core/lib/fiber/kill
# Stops a fiber. Pending resumes in the queue will not run.
#
# INPUT (storage datalib:input):
# id → fiber id
# ─────────────────────────────────────────────────────────────────

function datalib:core/lib/fiber/internal/kill_exec with storage datalib:input {}
