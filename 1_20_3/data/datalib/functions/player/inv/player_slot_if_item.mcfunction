# 1.20.3 fallback: named slot routing is not available here, so this checks the tagged inventory as a whole.
$execute as @a[name=$(player),limit=1] at @s if entity @s[nbt={Inventory:[{tag:{wand:"$(customData)"}}]}] run $(invoke)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"inv/player_slot_if_item ","color":"aqua"},{"text":"$(player)","color":"white"}]}
