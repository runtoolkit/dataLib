# datalib:systems/hook/internal/on_interact_shulker_box
# @s = player who triggered the event
data modify storage datalib:engine _hook_fire_tmp set value {event:"interact_shulker_box"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
