# datalib:systems/hook/internal/on_using_item
# @s = player who triggered the event
data modify storage datalib:engine _hook_fire_tmp set value {event:"using_item"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
