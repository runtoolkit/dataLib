# datalib:api/cmd/internal/sandbox_blocked_macro [1.20.3 overlay]
# INPUT: $(_sandbox_cmd) — read from datalib:engine storage via `with storage datalib:engine {}`
# Appends a WARN entry to the log buffer and notifies debug admins.
# Do NOT call directly — use datalib:api/cmd/internal/sandbox_blocked.
$data modify storage datalib:input message set value "[SANDBOX] cmd/$(_sandbox_cmd) blocked"
data modify storage datalib:input level set value "WARN"
data modify storage datalib:input color set value "yellow"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
$tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"SANDBOX ","color":"red","bold":true},{"text":"cmd/$(_sandbox_cmd) blocked","color":"red"}]
data remove storage datalib:input message
data remove storage datalib:input level
data remove storage datalib:input color
