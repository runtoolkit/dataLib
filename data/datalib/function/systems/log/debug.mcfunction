# datalib:systems/log/debug
# Usage: $function datalib:systems/log/debug {message:"[System] Trace detail"}
# Level: 4 — only shown when debug mode active
$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "DEBUG"
data modify storage datalib:input color set value "dark_gray"
execute if score #dl.log_level dl.log_level matches 4.. run function datalib:systems/log/add with storage datalib:input {}
