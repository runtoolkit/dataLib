# datalib:systems/hook/internal/on_drop
data modify storage datalib:engine _hook_fire_tmp set value {event:"drop_item"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
