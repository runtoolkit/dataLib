execute if score @s datalib.tick_guard = $epoch datalib.time run return 0

scoreboard players operation @s datalib.tick_guard = $epoch datalib.time

return 1
