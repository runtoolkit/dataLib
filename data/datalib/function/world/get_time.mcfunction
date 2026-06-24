# ─────────────────────────────────────────────────────────────────
# datalib:world/get_time
# Reads the current world time and writes it to datalib:output.
#
# OUTPUT: datalib:output daytime → ticks within the current day (0–23999)
# datalib:output total → total world age in ticks (never resets)
# datalib:output day → current in-game day number
#
# EXAMPLE:
# function datalib:world/get_time
# data get storage datalib:output daytime
# ─────────────────────────────────────────────────────────────────

execute store result storage datalib:output daytime int 1 run time query daytime
execute store result storage datalib:output total int 1 run time query gametime
execute store result storage datalib:output day int 1 run time query day
tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"world/get_time ","color":"aqua"},{"text":"day=","color":"gray"},{"storage":"datalib:output","nbt":"day","color":"green"},{"text":" daytime=","color":"gray"},{"storage":"datalib:output","nbt":"daytime","color":"green"}]