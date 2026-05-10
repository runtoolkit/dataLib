# Stage 0 Load
summon minecraft:marker ~ ~ ~ {Tags:["datalib.stage0"],CustomName:'{"text":"DL"}'}
execute as @e[type=minecraft:marker,tag=datalib.stage0,limit=1] run say Loading dataLib...
execute as @e[type=minecraft:marker,tag=datalib.stage0,limit=1] run schedule function dl_load:load/all 16t replace
execute as @e[type=minecraft:marker,tag=datalib.stage0,limit=1] run kill @s