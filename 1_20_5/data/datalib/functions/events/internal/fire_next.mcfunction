data modify storage datalib:engine _dispatch.func set from storage datalib:engine _event_tmp[0].func
function #macro:internal/dispatch
data remove storage datalib:engine _event_tmp[0]
execute if data storage datalib:engine _event_tmp[0] run function datalib:events/internal/fire_next
