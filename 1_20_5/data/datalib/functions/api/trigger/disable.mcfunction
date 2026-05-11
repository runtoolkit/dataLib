$scoreboard players reset $(player) datalib_action
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"trigger/disable ","color":"aqua"},{"text":"· ","color":"#555555"},{"text":"$(player)","color":"white"},{"text":" — datalib_action disabled","color":"#555555"}]}
