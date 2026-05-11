execute unless data storage datalib:engine dialog.DIALOG run return 0

scoreboard players set @s datalib.dialog_load -1
tag @s remove datalib.dialog_closed
tag @s remove datalib.dialog_opened
tag @s add datalib.dialog_opened

tellraw @s {"text":"","extra":[{"text":"[DL] ","color":"aqua","bold":true},{"text":"Dialog: ","color":"gray"},{"nbt":"dialog.DIALOG","storage":"datalib:engine","color":"yellow"},{"text":" — ","color":"#555555"},{"text":"This feature requires Minecraft 1.21.6 or higher.","color":"red","italic":true}]}

function datalib:api/dialog/notify_admins

return 1
