# ─────────────────────────────────────────────────────────────────
# datalib:api/wand/register_cmd
# Binds a command to the wand (raw command instead of func).
#
# INPUT:
#   $(tag) → custom_data tag name
#   $(cmd) → raw command to run
# ─────────────────────────────────────────────────────────────────

execute unless data storage datalib:engine wand_binds run data modify storage datalib:engine wand_binds set value []

$data modify storage datalib:engine wand_binds append value {tag:"$(tag)", func:"$(func)"}
$tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"wand/register_cmd ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" → func","color":"#555555"}]
