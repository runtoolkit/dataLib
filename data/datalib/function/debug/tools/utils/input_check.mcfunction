execute if data storage datalib:engine global{in_call:1b} run return 1

data modify storage datalib:output inputs set from storage datalib:input
data modify storage datalib:output data set from storage datalib:engine

execute unless data storage datalib:output data.global{loaded:1b} run return 0

# engine stores v2.2.2-pre1 (lowercase v)
execute unless data storage datalib:output data.global{version:"v5.1.1"} run return 0

# --- Tehlikeli komutlar: injection engeli (permission-level 3 / singleplayer uyumsuz) ---
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:engine {op:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:input {op:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:output {op:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/op with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:engine {ban:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:input {ban:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:output {ban:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:engine {ban_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:input {ban_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:output {ban_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:engine {pardon:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:input {pardon:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:output {pardon:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:engine {pardon_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:input {pardon_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:output {pardon_ip:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:engine {kick:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:input {kick:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:output {kick:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:engine {deop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:input {deop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:output {deop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:engine {stop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:input {stop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:output {stop:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:engine {whitelist:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:input {whitelist:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:output {whitelist:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:engine {data_remove_block:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:input {data_remove_block:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:output {data_remove_block:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:engine {data_remove_entity:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:input {data_remove_entity:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:output {data_remove_entity:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity with storage datalib:output {inputs:{}}"} run return 0

execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:engine {data_remove_storage:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:input {data_remove_storage:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:output {data_remove_storage:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage with storage datalib:output {inputs:{}}"} run return 0


# Block run_self: raw command execution bridge — open to any cmd injection
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:engine {cmd:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:input {cmd:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:output {cmd:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self with storage datalib:output {inputs:{}}"} run return 0

# Block multi_cmd_adv: multi-command execution path without admin guard
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv with storage datalib:engine {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv with storage datalib:input {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv with storage datalib:output {}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv with storage datalib:output {data:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv with storage datalib:output {inputs:{}}"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-all"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-off"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-on"} run return 0

# Block general injection attempts targeting sensitive storage paths
execute if data storage datalib:output inputs{func:"with storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{func:"with storage datalib:input"} run return 0
execute if data storage datalib:output inputs{func:"with storage datalib:output"} run return 0

# If validation passed, proceed to safe execution phase
# Set recursion guard so nested check_all calls (from api/cmd functions) skip re-execution
data modify storage datalib:engine global.in_call set value 1b
function datalib:core/engine/call/execute_validated
data remove storage datalib:engine global.in_call

# Clean up temporary data (memory management and security)
data remove storage datalib:output data
data remove storage datalib:output inputs
return 1
