$data modify storage datalib:input message set value "$(message)"
data modify storage datalib:input level set value "INFO"
data modify storage datalib:input color set value "green"
function datalib:systems/log/add with storage datalib:input {}
tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"log/info ","color":"aqua"}]}
