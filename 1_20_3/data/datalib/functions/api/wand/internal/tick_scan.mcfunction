# datalib:api/wand/internal/tick_scan
# Every tick: detect players with datalib.rightClick score 1+,
# check their held item, run the matching bind.

execute unless data storage datalib:engine wand_binds[0] run return 0

execute as @a[scores={datalib.rightClick=1..}] at @s run function datalib:api/wand/internal/dispatch
scoreboard players set @a[scores={datalib.rightClick=1..}] datalib.rightClick 0
