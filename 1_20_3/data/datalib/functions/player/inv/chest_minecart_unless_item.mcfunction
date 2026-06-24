$execute as @a at @s unless entity @e[type=minecraft:chest_minecart,distance=..2,limit=1,tag=$(tag),nbt={Items:[{Slot:$(slot)b,tag:{wand:"$(customData)"}}]}] run $(invoke)
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"inv/chest_minecart_unless_item ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]}
