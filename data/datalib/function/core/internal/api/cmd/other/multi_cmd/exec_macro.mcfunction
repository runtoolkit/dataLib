# ─────────────────────────────────────────────────────────────────
# datalib:api/cmd/other/multi_cmd/internal/exec_macro [MACRO]
# INPUT: $(cmd)
# ─────────────────────────────────────────────────────────────────

# SECURITY: central gate — loaded + perm_level + sandbox checks
execute unless function datalib:core/security/cmd_gate run return 0

tellraw @a[tag=datalib.admin] [{"selector":"@s","color":"gold"},{"text":" - command executed","color":"yellow"}]

$$(cmd)
