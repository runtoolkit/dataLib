execute unless function datalib:debug/tools/utils/check_all run return 0

# ─────────────────────────────────────────────────────────────────
# SANDBOX GUARD — sandbox modunda tehlikeli komutlar engellenir.
# Aktif:  /data modify storage datalib:engine sandbox set value 1b
# Pasif:  /data modify storage datalib:engine sandbox set value 0b
# ─────────────────────────────────────────────────────────────────
execute if data storage datalib:engine {sandbox:1b} run data modify storage datalib:engine _sandbox_cmd set value "forceload_add"
execute if data storage datalib:engine {sandbox:1b} run execute unless function datalib:api/cmd/internal/sandbox_gate run return 0
$forceload add $(x) $(z)
tellraw @a[tag=datalib.debug] {"text":"","extra":[{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"cmd/forceload_add ","color":"aqua"}]}
