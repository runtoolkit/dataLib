# datalib:player/internal/init_online
# @s = online player
# Called once per online player during load to ensure pid is assigned.
# Uses get_name to fetch the display name, then delegates to init_from_name.

function datalib:player/get_name
function datalib:player/internal/init_from_name with storage datalib:names temp
