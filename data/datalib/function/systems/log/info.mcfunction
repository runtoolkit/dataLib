# datalib:systems/log/info
# Usage: $function datalib:systems/log/info {message:"[System] Something happened"}
# Level: 3
$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "INFO"
data modify storage datalib:input color set value "gray"
execute if score #dl.log_level dl.log_level matches 3.. run function datalib:systems/log/add with storage datalib:input {}
