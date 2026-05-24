# ======================================================================================
# datalib:debug/tools/utils/input_check
# ======================================================================================
#
# dataLib Secure Validation Gateway
#
# PURPOSE:
#   Centralized security validation layer for all dynamic dataLib calls.
#
# DESCRIPTION:
#   Every externally supplied runtime request must pass through this
#   validation layer before execution is permitted.
#
# SECURITY GOALS:
#
#   • prevent privilege escalation
#   • prevent namespace escape
#   • prevent selector abuse
#   • prevent execute-chain hijacking
#   • prevent storage corruption
#   • prevent recursion abuse
#   • prevent dangerous runtime mutation
#   • prevent unauthorized engine access
#   • prevent command injection
#   • maintain deterministic execution
#
# VALIDATION PIPELINE:
#
#   1. recursion guard
#   2. engine state validation
#   3. input snapshot isolation
#   4. required field validation
#   5. namespace allowlist enforcement
#   6. internal namespace protection
#   7. dangerous command blocklist
#   8. selector escalation protection
#   9. execute abuse protection
#   10. storage injection protection
#   11. validated execution
#   12. cleanup
#
# RETURN VALUES:
#
#   return 1:
#       validation passed
#
#   return 0:
#       validation failed
#
# SECURITY POLICY:
#
#   FAIL CLOSED
#
#   Unknown behavior is considered unsafe until explicitly reviewed.
#
# ======================================================================================
# SECTION 1
# RECURSION GUARD
# ======================================================================================
#
# Prevent nested validation recursion.
#
# If execution already occurs inside a validated call,
# allow execution to continue without re-entering validation.
#
# ======================================================================================

execute if data storage datalib:engine global{in_call:1b} run return 1

# ======================================================================================
# SECTION 2
# ENGINE STATE VALIDATION
# ======================================================================================
#
# Ensure engine is fully initialized before accepting requests.
#
# ======================================================================================

execute unless data storage datalib:engine global{loaded:1b} run return 0

# ======================================================================================
# SECTION 3
# SNAPSHOT INPUTS
# ======================================================================================
#
# Copy all runtime data into isolated validation storage.
#
# This prevents:
#
#   • runtime mutation during validation
#   • inconsistent validation states
#   • storage race conditions
#
# ======================================================================================

data modify storage datalib:output inputs set from storage datalib:input
data modify storage datalib:output data set from storage datalib:engine
data modify storage datalib:output security set value {validated:0b,blocked:0b}

# ======================================================================================
# SECTION 4
# REQUIRED FIELD VALIDATION
# ======================================================================================
#
# Ensure mandatory runtime fields exist.
#
# REQUIRED:
#
#   inputs.func
#
# ======================================================================================

execute unless data storage datalib:output inputs.func run return 0

# ======================================================================================
# SECTION 5
# BASIC FUNCTION SANITY CHECKS
# ======================================================================================
#
# Prevent malformed execution identifiers.
#
# ======================================================================================

execute if data storage datalib:output inputs{func:""} run return 0
execute if data storage datalib:output inputs{func:" "} run return 0
execute if data storage datalib:output inputs{func:":"} run return 0
execute if data storage datalib:output inputs{func:"/"} run return 0

# ======================================================================================
# SECTION 6
# NAMESPACE ALLOWLIST
# ======================================================================================
#
# Only datalib:api/* may be externally executed.
#
# ======================================================================================

execute unless data storage datalib:output inputs{func:"datalib:api/"} run function datalib:core/security/input_ns_violation
execute unless data storage datalib:output inputs{func:"datalib:api/"} run return 0

# ======================================================================================
# SECTION 7
# INTERNAL NAMESPACE PROTECTION
# ======================================================================================
#
# Prevent direct access to protected internal systems.
#
# ======================================================================================

execute if data storage datalib:output inputs{func:"datalib:core/"} run return 0
execute if data storage datalib:output inputs{func:"datalib:engine/"} run return 0
execute if data storage datalib:output inputs{func:"datalib:debug/"} run return 0
execute if data storage datalib:output inputs{func:"datalib:private/"} run return 0
execute if data storage datalib:output inputs{func:"datalib:internal/"} run return 0

# ======================================================================================
# SECTION 8
# HIGH-RISK COMMAND BLOCKLIST
# ======================================================================================
#
# Explicitly deny dangerous command wrappers.
#
# ======================================================================================

execute if data storage datalib:output inputs{func:"datalib:api/cmd/op"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/deop"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/ban_ip"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/pardon_ip"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/kick"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/stop"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/reload"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/debug"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/perf"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/whitelist"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-all"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-off"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/save-on"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_block"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_entity"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/data_remove_storage"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/run_self"} run return 0
execute if data storage datalib:output inputs{func:"datalib:api/cmd/other/multi_cmd_adv"} run return 0

# ======================================================================================
# SECTION 9
# SELECTOR ESCALATION BLOCKS
# ======================================================================================
#
# PURPOSE:
#   Prevent selector-based privilege escalation attacks executed through
#   dynamically supplied command payloads.
#
# OVERVIEW:
#   Minecraft selectors are powerful because they may target:
#
#       • all players
#       • all entities
#       • execution contexts
#       • command proxies
#       • randomized targets
#
#   If unrestricted selectors are permitted,
#   attackers may gain administrative control.
#
# ======================================================================================

execute if data storage datalib:output inputs{cmd:"op @a"} run return 0
execute if data storage datalib:output inputs{cmd:"op @e"} run return 0
execute if data storage datalib:output inputs{cmd:"op @r"} run return 0
execute if data storage datalib:output inputs{cmd:"op @s"} run return 0
execute if data storage datalib:output inputs{cmd:"op @p"} run return 0

execute if data storage datalib:output inputs{cmd:"deop @a"} run return 0
execute if data storage datalib:output inputs{cmd:"deop @e"} run return 0
execute if data storage datalib:output inputs{cmd:"deop @r"} run return 0
execute if data storage datalib:output inputs{cmd:"deop @s"} run return 0
execute if data storage datalib:output inputs{cmd:"deop @p"} run return 0

execute if data storage datalib:output inputs{cmd:"execute as @a"} run return 0
execute if data storage datalib:output inputs{cmd:"execute as @e"} run return 0
execute if data storage datalib:output inputs{cmd:"execute as @r"} run return 0
execute if data storage datalib:output inputs{cmd:"execute as @p"} run return 0

execute if data storage datalib:output inputs{cmd:"execute at @a"} run return 0
execute if data storage datalib:output inputs{cmd:"execute at @e"} run return 0
execute if data storage datalib:output inputs{cmd:"execute at @r"} run return 0
execute if data storage datalib:output inputs{cmd:"execute at @p"} run return 0

execute if data storage datalib:output inputs{cmd:"@e[type=player]"} run return 0
execute if data storage datalib:output inputs{cmd:"@e[type=minecraft:player]"} run return 0
execute if data storage datalib:output inputs{cmd:"@e[tag=admin]"} run return 0
execute if data storage datalib:output inputs{cmd:"@e[tag=operator]"} run return 0

execute if data storage datalib:output inputs{cmd:"@a"} run return 0
execute if data storage datalib:output inputs{cmd:"@e"} run return 0

# ======================================================================================
# SECTION 10
# EXECUTION CHAIN ABUSE BLOCKS
# ======================================================================================
#
# Prevent nested execution hijacking.
#
# ======================================================================================

execute if data storage datalib:output inputs{cmd:"run function"} run return 0
execute if data storage datalib:output inputs{cmd:"schedule function"} run return 0

execute if data storage datalib:output inputs{cmd:"execute positioned"} run return 0
execute if data storage datalib:output inputs{cmd:"execute facing"} run return 0
execute if data storage datalib:output inputs{cmd:"execute rotated"} run return 0
execute if data storage datalib:output inputs{cmd:"execute on"} run return 0

# ======================================================================================
# SECTION 11
# COMMAND CHAIN INJECTION BLOCKS
# ======================================================================================
#
# Prevent multi-command payload injection.
#
# ======================================================================================

execute if data storage datalib:output inputs{cmd:";"} run return 0
execute if data storage datalib:output inputs{cmd:"&&"} run return 0
execute if data storage datalib:output inputs{cmd:"||"} run return 0
execute if data storage datalib:output inputs{cmd:"\n"} run return 0

# ======================================================================================
# SECTION 12
# STORAGE INJECTION BLOCKS
# ======================================================================================
#
# Prevent direct storage hijacking attempts.
#
# ======================================================================================

execute if data storage datalib:output inputs{func:"with storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{func:"with storage datalib:output"} run return 0
execute if data storage datalib:output inputs{func:"storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{func:"storage datalib:output"} run return 0

# ======================================================================================
# SECTION 13
# EXECUTE STORE ABUSE BLOCKS
# ======================================================================================
#
# Prevent runtime state corruption through execute store.
#
# ======================================================================================

execute if data storage datalib:output inputs{cmd:"execute store result storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{cmd:"execute store success storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{cmd:"data merge storage datalib:engine"} run return 0
execute if data storage datalib:output inputs{cmd:"data remove storage datalib:engine"} run return 0

# ======================================================================================
# SECTION 14
# VALIDATED EXECUTION LOCK
# ======================================================================================
#
# Mark execution context as validated.
#
# ======================================================================================

data modify storage datalib:engine global.in_call set value 1b

# ======================================================================================
# SECTION 15
# EXECUTE VALIDATED FUNCTION
# ======================================================================================

function datalib:core/engine/call/execute_validated

# ======================================================================================
# SECTION 16
# CLEANUP EXECUTION LOCK
# ======================================================================================

data remove storage datalib:engine global.in_call

# ======================================================================================
# SECTION 17
# CLEANUP TEMPORARY STORAGE
# ======================================================================================

data remove storage datalib:output data
data remove storage datalib:output security
data remove storage datalib:output inputs

# ======================================================================================
# SECTION 18
# SUCCESS RETURN
# ======================================================================================

return 1
