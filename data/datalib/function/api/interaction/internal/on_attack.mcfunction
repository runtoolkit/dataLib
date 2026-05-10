tag @s add macro.ia_active

data modify storage datalib:engine _ia_iter set from storage datalib:engine interaction_binds.attack
execute if data storage datalib:engine _ia_iter[0] run execute on attacker run function datalib:api/interaction/internal/dispatch

tag @s remove macro.ia_active
data remove entity @s attack
data remove storage datalib:engine _ia_iter
data remove storage datalib:engine _ia_cur
