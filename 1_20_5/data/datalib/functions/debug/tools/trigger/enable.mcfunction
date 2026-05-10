# Admin-protected trigger/enable.
# Usage: {player:"Name"}
execute unless function datalib:debug/tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function datalib:api/trigger/enable {player:"$(player)"}
$tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"trigger/enable ","color":"aqua"},{"text":"$(player)","color":"white"}]
