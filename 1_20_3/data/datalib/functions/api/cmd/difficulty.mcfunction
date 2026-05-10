execute unless function datalib:debug/tools/utils/check_all run return 0

$difficulty $(level)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/difficulty ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(level)","color":"aqua"}]}
