execute unless function datalib:debug/tools/utils/check_all run return 0

$gamerule $(rule) $(value)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/gamerule ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(rule)","color":"aqua"}]}
