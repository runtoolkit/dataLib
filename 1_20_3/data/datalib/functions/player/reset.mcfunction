$data remove storage datalib:engine players.$(player)
$data remove storage datalib:engine cooldowns.$(player)
$advancement revoke @a[name=$(player),limit=1] from datalib:hidden/root
function datalib:player/init with storage datalib:input {}
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"player/reset ","color":"aqua"},{"text":"$(player)","color":"white"}]}
