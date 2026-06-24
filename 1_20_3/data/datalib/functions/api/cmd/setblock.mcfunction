execute unless function datalib:debug/tools/utils/check_all run return 0

$setblock $(x) $(y) $(z) $(block) $(mode)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/setblock ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(mode)","color":"aqua"}]}
