# ─────────────────────────────────────────────────────────────────
# datalib:world/time_phase
# Classifies the current daytime tick into a named phase and
# provides boolean flags for common time-of-day checks.
#
# No input — reads world daytime directly.
#
# Output: datalib:output phase → "dawn" / "day" / "dusk" / "night"
# datalib:output daytime → raw daytime tick (0–23999)
# datalib:output is_day → 1b if sun is up (0–12999)
# datalib:output is_night → 1b if moon is up (13000–23999)
# datalib:output is_dawn → 1b during dawn (0–999)
# datalib:output is_dusk → 1b during dusk (12000–13799)
#
# Phase boundaries (vanilla daytime ticks):
# Dawn : 0 – 999 sunrise / start of day
# Day : 1000 – 11999 full daylight
# Dusk : 12000 – 13799 sunset / twilight
# Night : 13800 – 23999 darkness / moon visible
#
# Example:
# function datalib:world/time_phase
# data get storage datalib:output phase
# # → "day"
# ─────────────────────────────────────────────────────────────────

execute store result score $tp_t dl.tmp run time query daytime
execute store result storage datalib:output daytime int 1 run scoreboard players get $tp_t dl.tmp

# Boolean flags
data modify storage datalib:output is_day set value 0b
data modify storage datalib:output is_night set value 0b
data modify storage datalib:output is_dawn set value 0b
data modify storage datalib:output is_dusk set value 0b

execute if score $tp_t dl.tmp matches 0..12999 run data modify storage datalib:output is_day set value 1b
execute if score $tp_t dl.tmp matches 13000..23999 run data modify storage datalib:output is_night set value 1b
execute if score $tp_t dl.tmp matches 0..999 run data modify storage datalib:output is_dawn set value 1b
execute if score $tp_t dl.tmp matches 12000..13799 run data modify storage datalib:output is_dusk set value 1b

# Named phase
execute if score $tp_t dl.tmp matches 0..999 run data modify storage datalib:output phase set value "dawn"
execute if score $tp_t dl.tmp matches 1000..11999 run data modify storage datalib:output phase set value "day"
execute if score $tp_t dl.tmp matches 12000..13799 run data modify storage datalib:output phase set value "dusk"
execute if score $tp_t dl.tmp matches 13800..23999 run data modify storage datalib:output phase set value "night"

tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"world/time_phase ","color":"aqua"},{"storage":"datalib:output","nbt":"phase","color":"green"},{"text":" t=","color":"gray"},{"storage":"datalib:output","nbt":"daytime","color":"white"}]