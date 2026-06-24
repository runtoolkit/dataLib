# ─────────────────────────────────────────────────────────────────
# datalib:api/wand/cooldown_check
# Wand cooldown aktif mi?
#
# INPUT:
#   $(player) → player name
#   $(tag)    → wand tag
# OUTPUT:
# datalib:output result → 0b=ready, 1b=cooldown active
# ─────────────────────────────────────────────────────────────────

data modify storage datalib:output result set value 0b

$execute unless data storage datalib:engine cooldowns.$(player).wand_$(tag) run return 0

$execute store result score $wcc_exp dl.tmp run data get storage datalib:engine cooldowns.$(player).wand_$(tag)
execute store result score $wcc_now dl.tmp run scoreboard players get $epoch datalib.time

execute if score $wcc_now dl.tmp < $wcc_exp dl.tmp run data modify storage datalib:output result set value 1b
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"wand/cooldown_check ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"datalib:output","nbt":"result","color":"green"}]}
