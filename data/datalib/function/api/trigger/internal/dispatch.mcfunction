scoreboard players operation $tc_player dl.tmp = @s macro_action

scoreboard players set @s macro_action 0
scoreboard players enable @s macro_action

execute unless data storage datalib:engine trigger_binds[0] run return 0

data modify storage datalib:engine _tc_binds set from storage datalib:engine trigger_binds

function datalib:api/trigger/internal/check_next
data remove storage datalib:engine _tc_binds
data remove storage datalib:engine _tc_current
