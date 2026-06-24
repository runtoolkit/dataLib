execute unless function datalib:debug/tools/utils/check_all run return 0

$forceload remove $(x) $(z)
tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/forceload_remove ","color":"aqua"}]}
