execute as @a run function datalib:core/lib/tick_guard_clear

execute as @a[scores={datalib_menu=1..}] run function datalib:menu
scoreboard players set @a[scores={datalib_menu=1..}] datalib_menu 0
scoreboard players enable @a[scores={datalib_menu=-1..}] datalib_menu

execute as @a[scores={macro_run=1..}] run function #datalib:admin/run
scoreboard players set @a[scores={macro_run=1..}] datalib_run 0
scoreboard players enable @a[scores={macro_run=-1..}] datalib_run

execute as @a[scores={macro_action=1..}] run function datalib:api/trigger/internal/dispatch

function datalib:api/interaction/internal/tick_scan

function datalib:api/perm/trigger/internal/tick_start

function datalib:api/wand/internal/tick_scan

function datalib:systems/hook/internal/tick_scan

function datalib:systems/geo/region_watch/internal/tick_scan
# Event bus — on_tick
function #datalib:events/on_tick
