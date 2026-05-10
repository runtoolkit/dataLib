# datalib:api/dialog/internal/load_exec [1.20.3 overlay]
# Stub — /dialog command requires 1.21.6+.
# Sets the expected scoreboard/tag state for caller compatibility.
# In 1.21.6+ this drives the native dialog cooldown; here it is a no-op.
$scoreboard players set @s datalib.dialog_load $(cooldown)
tag @s remove datalib.dialog_opened
tag @s add datalib.dialog_opened
tag @s add datalib.dialog_closed
