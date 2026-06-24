$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "DEBUG"
data modify storage datalib:input color set value "gray"
function datalib:systems/log/add with storage datalib:input {}
tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"log/debug ","color":"aqua"}]}
