# datalib:core/fallback/generic
# Called when no specific fallback applies.
data modify storage datalib:input message set value "[Fallback] generic fallback triggered"
data modify storage datalib:input level set value "WARN"
data modify storage datalib:input color set value "yellow"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
data modify storage datalib:output fallback set value {triggered:1b,reason:"generic"}
return 0
