# datalib:core/security/multi_type_check [1.20.5 overlay]
# Validates datalib:engine multiCommands.type against security.multi_type_allowlist.
# Returns 1 → type is valid. Returns 0 → type violation fired (log + kick).
data modify storage datalib:engine _mcmd_type_tmp set from storage datalib:engine multiCommands.type
function datalib:core/security/multi_type_check_macro with storage datalib:engine {}
data remove storage datalib:engine _mcmd_type_tmp
