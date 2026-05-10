execute as @a[scores={dl_menu=1..}] run function datalib:menu
scoreboard players set @a[scores={dl_menu=1..}] dl_menu 0
scoreboard players enable @a[scores={dl_menu=-1..}] dl_menu

execute as @a[scores={macro_run=1..}] run function #macro:run
scoreboard players set @a[scores={macro_run=1..}] macro_run 0
scoreboard players enable @a[scores={macro_run=-1..}] macro_run

execute as @a[scores={macro_action=1..}] run function datalib:api/trigger/internal/dispatch

function datalib:api/interaction/internal/tick_scan

function datalib:api/perm/trigger/internal/tick_start

scoreboard players remove @a[scores={macro.dialog_load=1..}] macro.dialog_load 1

# Countdown actionbar: show remaining ticks while dialog is loading
#execute as @a[scores={macro.dialog_load=1..},tag=macro.dialog_opened,tag=!macro.dialog_closed] run title @s actionbar ["",{"text":"Loading ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"macro.dialog_load"},"color":"yellow","bold":true},{"text":" ticks","color":"gray"}]
execute as @a[scores={macro.dialog_load=1..}] run title @s actionbar ["",{"text":"Loading ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"macro.dialog_load"},"color":"yellow","bold":true},{"text":" ticks","color":"gray"}]

execute as @a[scores={macro.dialog_load=0},tag=macro.dialog_closed] at @s run function datalib:api/dialog/open
execute as @a[scores={macro.dialog_load=0},tag=!macro.dialog_closed,tag=!macro.dialog_opened] at @s run function datalib:api/dialog/open

function datalib:api/wand/internal/tick_scan
function datalib:systems/hook/internal/tick_scan

function datalib:systems/geo/region_watch/internal/tick_scan