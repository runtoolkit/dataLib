# datalib:core/security/type_violation [1.20.5 overlay]
# Fired when a command type or sandbox command is not in the allowlist.
# Logs an ERROR entry, notifies admins, and kicks the offending player.
#
# NOTE: test_block server-log (added in 1.21.5) is NOT available on this version.
# Context: @s = the player who triggered the violation.

data modify storage datalib:input message set value "[Security] type_violation — command type not in allowlist"
data modify storage datalib:input level set value "ERROR"
data modify storage datalib:input color set value "red"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
data remove storage datalib:input message
data remove storage datalib:input level
data remove storage datalib:input color

tellraw @s ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Security violation: command type not permitted in sandbox mode.","color":"red"}]
tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"TYPE VIOLATION ","color":"red","bold":true},{"selector":"@s","color":"gold"},{"text":" — blocked (not in allowlist)","color":"red"}]
#execute if entity @s[type=minecraft:player] run kick @s [DL] Security violation — command type not in allowlist
