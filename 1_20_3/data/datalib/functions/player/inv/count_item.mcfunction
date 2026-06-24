scoreboard players set $inv_cnt dl.tmp 0
$execute as @a[name=$(player),limit=1] run execute store result score $inv_cnt dl.tmp run clear @s minecraft:carrot_on_a_stick{wand:"$(customData)"} 0
execute store result storage datalib:output count int 1 run scoreboard players get $inv_cnt dl.tmp
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"inv/count_item ","color":"aqua"},{"text":"$(player)","color":"white"}]}
