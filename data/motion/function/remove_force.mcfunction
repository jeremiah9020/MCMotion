execute if score @s motion.active matches 0 run return 0
function id:get/executor
data modify storage id:io in set from storage id:io out
$data remove storage id:io in.motion[{id: "$(id)"}]
function id:set/executor