# datalib:api/wand/internal/tick_scan
# Every tick: detect players with macro.rightClick score 1+,
# check their held item, run the matching bind.

# Module toggle guard — skips this module when disabled via datalib:api/toggle/wand/false
execute unless data storage datalib:engine {modules:{wand:1b}} run return 0

execute unless data storage datalib:engine wand_binds[0] run return 0

execute as @a[scores={macro.rightClick=1..}] at @s run function datalib:api/wand/internal/dispatch
scoreboard players set @a[scores={macro.rightClick=1..}] macro.rightClick 0
