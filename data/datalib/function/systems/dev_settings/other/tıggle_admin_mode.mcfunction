execute at @s if data storage datalib:engine {dev_settings:{devMode:1b}} run tag @s add datalib.admin

execute at @s if data storage datalib:engine {dev_settings:{devMode:0b}} run tag @s remove datalib.admin
