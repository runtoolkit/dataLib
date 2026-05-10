# ─────────────────────────────────────────────────────────────────
# datalib:core/security/cmd_perm_denied
# Fired by cmd_gate when @s lacks sufficient dl.perm_level.
# Logs a WARN entry and notifies the player.
# ─────────────────────────────────────────────────────────────────
data modify storage datalib:input message set value "[Security] cmd_gate — insufficient perm_level"
data modify storage datalib:input level set value "WARN"
data modify storage datalib:input color set value "yellow"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
data remove storage datalib:input message
data remove storage datalib:input level
data remove storage datalib:input color

tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Insufficient permission level to execute this command.","color":"red"}]
tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"SECURITY ","color":"red","bold":true},{"selector":"@s","color":"gold"},{"text":" — cmd blocked (perm_level too low)","color":"red"}]
