# datalib:core/fallback/not_loaded
# Called when the engine is not initialized.
data modify storage datalib:input message set value "[Fallback] not_loaded — dataLib not initialized, run /function datalib:load"
data modify storage datalib:input level set value "ERROR"
data modify storage datalib:input color set value "red"
execute if score #dl.log_level dl.log_level matches 1.. run function datalib:systems/log/add with storage datalib:input {}
data modify storage datalib:output fallback set value {triggered:1b,reason:"not_loaded"}
return 0
