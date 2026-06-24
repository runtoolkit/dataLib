execute unless function datalib:debug/tools/utils/check_all run return 0

$place structure $(structure) $(x) $(y) $(z)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/place_structure ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(structure)","color":"aqua"}]}
