$execute as @a[name=$(player),limit=1] at @s unless entity @s[nbt={Inventory:[{tag:{wand:"$(customData)"}}]}] run $(invoke)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"inv/player_unless_item ","color":"aqua"},{"text":"$(player)","color":"white"}]}
