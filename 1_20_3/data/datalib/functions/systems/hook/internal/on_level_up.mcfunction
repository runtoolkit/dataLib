# datalib:systems/hook/internal/on_level_up
# @s = tetikleyen oyuncu
data modify storage datalib:engine _hook_fire_tmp set value {event:"level_up"}
function datalib:systems/hook/internal/fire with storage datalib:engine _hook_fire_tmp
data remove storage datalib:engine _hook_fire_tmp
