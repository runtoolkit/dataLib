# datalib:core/security/multi_type_check_macro [MACRO]
# Called with storage datalib:engine {} — reads $(_mcmd_type_tmp) from engine.
# Checks if the type exists as a key in security.multi_type_allowlist.
$execute if data storage datalib:engine security.multi_type_allowlist{$(_mcmd_type_tmp):1b} run function datalib:core/empty
$execute unless data storage datalib:engine security.multi_type_allowlist{$(_mcmd_type_tmp):1b} run function datalib:core/security/type_violation