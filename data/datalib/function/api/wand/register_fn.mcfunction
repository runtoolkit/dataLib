# ─────────────────────────────────────────────────────────────────
# datalib:api/wand/register_fn
# Binds a function to a wand (carrot_on_a_stick).
#
# INPUT (storage datalib:input):
#   tag  → custom_data tag name
#   func → function to run
# ─────────────────────────────────────────────────────────────────
execute unless data storage datalib:engine wand_binds run data modify storage datalib:engine wand_binds set value []
function datalib:api/wand/internal/register_fn_do with storage datalib:input {}
