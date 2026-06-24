execute unless function datalib:debug/tools/utils/check_all run return 0

$summon $(entity) $(x) $(y) $(z) $(nbt)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/summon ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(entity)","color":"aqua"}]}
