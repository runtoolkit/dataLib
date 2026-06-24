# datalib:api/wand/has [LEGACY]
# Does the player hold a specific wand in their main hand?

data modify storage datalib:output result set value 0b
$execute as @a[name=$(player),limit=1,nbt={SelectedItem:{tag:{wand:"$(tag)"}}}] run data modify storage datalib:output result set value 1b
$tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"wand/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"datalib:output","nbt":"result","color":"green"}]}
