# datalib:api/wand/internal/fire [MACRO]
# Run the bind based on func or cmd field.

execute if data storage datalib:engine _wand_current.func run function datalib:api/wand/internal/call_func with storage datalib:engine _wand_current
execute if data storage datalib:engine _wand_current.cmd run function datalib:api/wand/internal/call_cmd with storage datalib:engine _wand_current
