# datalib:api/dialog/open
# Opens the dialog stored in datalib:engine dialog.DIALOG for the executing player.
# Requires Minecraft 1.21.6+ for the actual /dialog show command.
# On older versions this stub sets tag state and fires a version error.
#
# Pre-condition: caller must have written dialog data to:
#   datalib:engine dialog.DIALOG  (compound with at least "type" and "title" fields)
#
# BUGFIX v6.0.1: guard was checking for the literal path "dialog.DIALOG" as a
# compound key which is ambiguous with an empty compound match.
# Fixed to check for the "type" field which is always required, making the guard
# semantically correct. Also removed malformed tellraw extra[] nesting.

execute unless data storage datalib:engine dialog.DIALOG.type run return 0

scoreboard players set @s datalib.dialog_load -1
tag @s remove datalib.dialog_closed
tag @s remove datalib.dialog_opened
tag @s add datalib.dialog_opened

tellraw @s ["",{"text":"[DL] ","color":"aqua","bold":true},{"text":"Dialog: ","color":"gray"},{"nbt":"dialog.DIALOG.title","storage":"datalib:engine","color":"yellow"},{"text":" — ","color":"#555555"},{"text":"This feature requires Minecraft 1.21.6 or higher.","color":"red","italic":true}]

function datalib:api/dialog/notify_admins

return 1
