# datalib:systems/dev_settings/display/open
# Builds the Dev Settings written book in datalib:temp and gives it to @s.
# Called by the chat link in datalib:systems/dev_settings/menu.
# Page routing is driven by the player's dl.dev_pg2 score.

execute unless function datalib:debug/tools/utils/perm_check run return 0

# Reset page-2 cursor to slot 1 (version) if not already set
execute unless score @s dl.dev_pg2 matches 1..2 run scoreboard players set @s dl.dev_pg2 1

# Clear any existing settings book from the player
clear @s minecraft:written_book[custom_data={datalib_dev_settings:1b}]

# Dispatch page render — writes the page JSON into datalib:temp dev_settings_pages
execute as @s[scores={dl.dev_pg2=1}] run function datalib:systems/dev_settings/display/page/version
execute as @s[scores={dl.dev_pg2=2}] run function datalib:systems/dev_settings/display/page/devmode

# Give the book using the standard give command with component syntax
# Pages are written by page/* functions into datalib:temp dev_settings_pages
function datalib:systems/dev_settings/display/internal/give_book

# Cleanup
data remove storage datalib:temp dev_settings_pages
