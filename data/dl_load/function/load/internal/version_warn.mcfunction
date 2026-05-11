playsound datalib:ui.error master @a ~ ~ ~ 0.7 0.8
tellraw @a [{"text":"\uE000","font":"datalib:datalib"datalib:datalib","color":"#00AAAA"},{"text":" ✘ ","color":"red"},{"translate":"datalib.msg.version_conflict","color":"red","bold":true}]
tellraw @a ["",{"text":" ","color":"#555555"},{"translate":"datalib.msg.version_reload","color":"gray"}]

tellraw @a[tag=datalib.debug] ["",{"text":"[DL] ","color":"#00AAAA","bold":true},{"text":"DEBUG ","color":"aqua"},{"text":"dl.pre_version scores → ","color":"#555555"},{"text":"major=","color":"gray"},{"score":{"name":"#dl.major","objective":"dl.pre_version"},"color":"yellow"},{"text":" minor=","color":"gray"},{"score":{"name":"#dl.minor","objective":"dl.pre_version"},"color":"yellow"},{"text":" patch=","color":"gray"},{"score":{"name":"#dl.patch","objective":"dl.pre_version"},"color":"yellow"},{"text":" pre=","color":"gray"},{"score":{"name":"#dl.pre","objective":"dl.pre_version"},"color":"yellow"},{"text":" (expected: 4 0 4 pre=0)","color":"red"}]

data modify storage datalib:input message set value "✘ Version mismatch — expected v5.1.0. Load aborted."
function datalib:systems/log/warn with storage datalib:input {}
data remove storage datalib:input message
