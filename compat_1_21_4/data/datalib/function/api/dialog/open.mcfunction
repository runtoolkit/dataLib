execute unless data storage datalib:engine dialog.DIALOG run return 0

scoreboard players set @s datalib.dialog_load -1
tag @s remove datalib.dialog_closed
tag @s remove datalib.dialog_opened
tag @s add datalib.dialog_opened

tellraw @s ["",{"text":"[DL] ","color":"aqua","bold":true},{"text":"Dialog: ","color":"gray"},{"nbt":"dialog.DIALOG","storage":"datalib:engine","color":"yellow"},{"text":" — ","color":"#555555"},{"text":"[Load]","color":"green","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","value":{"text":"Upgrade to 1.21.6+ for native dialog support","color":"gray"}}}]

function datalib:api/dialog/notify_admins

return 1
