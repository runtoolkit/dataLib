# datalib:systems/log/show
# Usage: /function datalib:systems/log/show
# Prints the log buffer to the calling player.
# Requires: datalib.admin tag
execute unless entity @s[tag=datalib.admin] run return 0

tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"━━━ Log Buffer ","color":"aqua"},{"text":"(level: ","color":"#555555"},{"score":{"name":"#dl.log_level","objective":"dl.log_level"},"color":"white"},{"text":")","color":"#555555"},{"text":"━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage datalib:engine log_display[0] run tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"(empty)","color":"gray","italic":true}]
execute unless data storage datalib:engine log_display[0] run return 0

function datalib:core/lib/input_push
data modify storage datalib:engine _felist_input set from storage datalib:engine log_display
data modify storage datalib:input func set value "datalib:systems/log/internal/print_entry"
function datalib:core/lib/for_each_list with storage datalib:input {}
function datalib:core/lib/input_pop

tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
