# Admin-protected trigger/list. Takes no arguments.
execute unless function datalib:debug/tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

function datalib:api/trigger/list
