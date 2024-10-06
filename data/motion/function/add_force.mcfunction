execute if score @s motion.active matches 0 run return 0

function id:get/executor
data modify storage id:io in set from storage id:io out
$data remove storage id:io in.motion[{id: "$(id)"}]

data modify storage motion:temp force set value { \
    ax: 0, \
    ay: 0, \
    az: 0, \
    duration: -1, \
}

$data modify storage motion:temp force.id set value "$(id)"
$data modify storage motion:temp opts set value $(opts)

execute if data storage motion:temp opts.acc run data modify storage motion:temp force.ax set from storage motion:temp opts.acc[0]
execute if data storage motion:temp opts.acc run data modify storage motion:temp force.ay set from storage motion:temp opts.acc[1]
execute if data storage motion:temp opts.acc run data modify storage motion:temp force.az set from storage motion:temp opts.acc[2]
execute if data storage motion:temp opts.duration run data modify storage motion:temp force.duration set from storage motion:temp opts.duration

data modify storage id:io in.motion append from storage motion:temp force
function id:set/executor