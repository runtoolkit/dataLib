$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "ERROR"
data modify storage datalib:input color set value "red"
function datalib:systems/log/add with storage datalib:input {}
tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"log/error ","color":"aqua"}]}
