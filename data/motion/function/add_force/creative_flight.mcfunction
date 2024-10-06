data modify storage motion:temp creative_flight set value {id:"creative_flight", opts: {acc: [0d, 0d, 0d]}}

# WASD!
scoreboard players set fb motion.thread 0
scoreboard players set lr motion.thread 0
execute if predicate motion:forward run scoreboard players add fb motion.thread 1
execute if predicate motion:backward run scoreboard players remove fb motion.thread 1
execute if predicate motion:left run scoreboard players remove lr motion.thread 1
execute if predicate motion:right run scoreboard players add lr motion.thread 1

# Vertical!
execute if predicate motion:jump unless predicate motion:sneak run function motion:update_context {opts:{vel:{y: 8.15d}}}
execute unless predicate motion:jump if predicate motion:sneak run function motion:update_context {opts:{vel:{y: -8.15d}}}
execute unless predicate motion:jump unless predicate motion:sneak run function motion:update_context {opts:{vel:{y: 0d}}}
    
# If no input, return
execute if score fb motion.thread matches 0 if score lr motion.thread matches 0 run return run function motion:add_force with storage motion:temp creative_flight

# Adjust direction based on input
data modify storage motion:temp rotation.x set from entity @p Rotation[0]
data modify storage motion:temp rotation.y set value 0
execute if score fb motion.thread matches 1 if score lr motion.thread matches -1 run data modify storage motion:temp rotation.y set value -45
execute if score fb motion.thread matches 0 if score lr motion.thread matches -1 run data modify storage motion:temp rotation.y set value -90
execute if score fb motion.thread matches 1 if score lr motion.thread matches 1 run data modify storage motion:temp rotation.y set value 45
execute if score fb motion.thread matches 0 if score lr motion.thread matches 1 run data modify storage motion:temp rotation.y set value 90
execute if score fb motion.thread matches -1 if score lr motion.thread matches -1 run data modify storage motion:temp rotation.y set value -135
execute if score fb motion.thread matches -1 if score lr motion.thread matches 1 run data modify storage motion:temp rotation.y set value 135
execute if score fb motion.thread matches -1 if score lr motion.thread matches 0 run data modify storage motion:temp rotation.y set value 180
function gm:add with storage motion:temp rotation
data modify storage motion:temp direction.x set from storage gm:io out

# Adjust scale based on sprint
data modify storage motion:temp scale.y set value 1.0d
# execute if predicate snapshot:sneak run data modify storage motion:temp scale.y set value 0.5d
execute if predicate motion:sprint run data modify storage motion:temp scale.y set value 2.0d

function gm:cos with storage motion:temp direction
data modify storage motion:temp scale.x set from storage gm:io out
function gm:multiply with storage motion:temp scale
execute store result storage motion:temp creative_flight.opts.acc[2] double 1 run data get storage gm:io out 22


function gm:sin with storage motion:temp direction
data modify storage motion:temp direction.x set from storage gm:io out
function gm:negate with storage motion:temp direction
data modify storage motion:temp scale.x set from storage gm:io out
function gm:multiply with storage motion:temp scale
execute store result storage motion:temp creative_flight.opts.acc[0] double 1 run data get storage gm:io out 22

function motion:add_force with storage motion:temp creative_flight
