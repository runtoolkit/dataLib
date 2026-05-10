# datalib:systems/log/warn
# Usage: $function datalib:systems/log/warn {message:"[System] Something suspicious"}
# Level: 2
$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "WARN"
data modify storage datalib:input color set value "yellow"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
