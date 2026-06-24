# datalib:api/wand/internal/check_item [LEGACY]
# $(tag) → custom_data tag name
# 1.20.3 uses NBT matching on SelectedItem instead of execute if items.

$execute if entity @s[nbt={SelectedItem:{tag:{wand:"$(tag)"}}}] run function datalib:api/wand/internal/fire with storage datalib:engine _wand_current
