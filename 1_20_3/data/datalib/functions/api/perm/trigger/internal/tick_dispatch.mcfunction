$execute as @a[scores={$(name)=1..}] run function datalib:api/perm/trigger/internal/player_dispatch with storage datalib:engine _pt_tick_ctx

$execute as @a run scoreboard players enable @s $(name)
