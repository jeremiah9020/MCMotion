$data modify storage motion:temp opts set value $(opts)

function id:get/executor
data modify storage id:io in set from storage id:io out
data modify storage id:io in.motion set value [] 

# If the player already has motion, they are in the cart, in this case, we only need one tick to catch up to motion
scoreboard players set @s motion.start 4
execute if score @s motion.active matches 1 run scoreboard players add @s motion.start 1

# Set defaults and then override with options
scoreboard players set @s motion.active 1
scoreboard players set @s motion.velocity.x 0
scoreboard players set @s motion.velocity.y 0
scoreboard players set @s motion.velocity.z 0
scoreboard players set @s motion.drag 1000
scoreboard players set @s motion.damping 0
scoreboard players set @s motion.friction.x 1000
scoreboard players set @s motion.friction.y 1000
scoreboard players set @s motion.friction.z 1000
scoreboard players set @s motion.cancel.stop 0
scoreboard players set @s motion.cancel.death 1
scoreboard players set @s motion.cancel.ground 0
scoreboard players set @s motion.cancel.speed -1
scoreboard players set @s motion.stop 0
execute if data storage motion:temp opts.vel store result score @s motion.velocity.x run data get storage motion:temp opts.vel[0] 1000
execute if data storage motion:temp opts.vel store result score @s motion.velocity.y run data get storage motion:temp opts.vel[1] 1000
execute if data storage motion:temp opts.vel store result score @s motion.velocity.z run data get storage motion:temp opts.vel[2] 1000
execute if data storage motion:temp opts.drag store result score @s motion.drag run data get storage motion:temp opts.drag 1000
execute if data storage motion:temp opts.damp store result score @s motion.damping run data get storage motion:temp opts.damp 1000
execute if data storage motion:temp opts.friction store result score @s motion.friction.x run data get storage motion:temp opts.friction[0] 1000
execute if data storage motion:temp opts.friction store result score @s motion.friction.y run data get storage motion:temp opts.friction[1] 1000
execute if data storage motion:temp opts.friction store result score @s motion.friction.z run data get storage motion:temp opts.friction[2] 1000
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.stop store result score @s motion.cancel.stop run data get storage motion:temp opts.cancel.stop
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.death store result score @s motion.cancel.death run data get storage motion:temp opts.cancel.death
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.ground store result score @s motion.cancel.ground run data get storage motion:temp opts.cancel.ground
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.speed store result score @s motion.cancel.speed run data get storage motion:temp opts.cancel.speed 1000

execute if data storage motion:temp {opts:{continuity:true}} run function motion:zzz/continuity



# Summon the cart
function motion:zzz/summon_cart

function id:set/executor