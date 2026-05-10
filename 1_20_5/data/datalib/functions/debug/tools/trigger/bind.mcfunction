# Admin-protected trigger/bind. Wraps datalib:api/trigger/bind.
# Usage: {value:1, func:"ns:path"}
execute unless function datalib:debug/tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function datalib:api/trigger/bind {value:$(value), func:"$(func)"}
$tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"trigger/bind ","color":"aqua"},{"text":"$(value)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
