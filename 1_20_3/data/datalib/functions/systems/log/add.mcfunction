execute unless data storage datalib:engine log_display run data modify storage datalib:engine log_display set value []

$data modify storage datalib:engine log_display append value {text:"[$(level)] $(message)",color:"$(color)"}

scoreboard players add #dl.log_count dl.tmp 1
execute if score #dl.log_count dl.tmp matches 31.. run data remove storage datalib:engine log_display[0]
execute if score #dl.log_count dl.tmp matches 31.. run scoreboard players remove #dl.log_count dl.tmp 1
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"log/add ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(level)","color":"aqua"}]}
