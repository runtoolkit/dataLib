$execute as @a[name=$(player),limit=1] run clear @s minecraft:carrot_on_a_stick{wand:"$(customData)"} $(count)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"inv/clear_custom ","color":"aqua"},{"text":"$(player)","color":"white"}]}
