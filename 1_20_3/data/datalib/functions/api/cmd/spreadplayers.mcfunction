execute unless function datalib:debug/tools/utils/check_all run return 0

$spreadplayers $(cx) $(cz) $(spread) $(max_range) false $(target)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/spreadplayers ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(target)","color":"aqua"}]}
