# datalib:systems/hook/internal/on_eat_fire
# @s = yiyen oyuncu
data modify storage datalib:engine _hook_fire_tmp set value {event:"eat"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
