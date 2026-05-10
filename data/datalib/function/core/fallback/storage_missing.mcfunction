# datalib:core/fallback/storage_missing
# Called when expected NBT storage data is absent.
data modify storage datalib:input message set value "[Fallback] storage_missing — required NBT key not found"
data modify storage datalib:input level set value "WARN"
data modify storage datalib:input color set value "yellow"
execute if score #dl.log_level dl.log_level matches 2.. run function datalib:systems/log/add with storage datalib:input {}
data modify storage datalib:output fallback set value {triggered:1b,reason:"storage_missing"}
return 0
