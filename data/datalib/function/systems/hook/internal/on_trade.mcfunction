# datalib:systems/hook/internal/on_trade
# @s = the triggering player
data modify storage datalib:engine _hook_fire_tmp set value {event:"trade"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
