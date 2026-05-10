execute if score @s macro.tick_guard = $epoch datalib.time run return 0

scoreboard players operation @s macro.tick_guard = $epoch datalib.time

return 1
