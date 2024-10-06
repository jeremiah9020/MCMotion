execute if score @s motion.active matches 0 run return 0

$data modify storage motion:temp opts set value $(opts)

# If the player already has motion, they are in the cart, in this case, we only need one tick to catch up to motion
execute if data storage motion:temp opts.vel if score @s motion.start matches ..1 run scoreboard players set @s motion.start 1

# Overrides!
execute if data storage motion:temp opts.vel if data storage motion:temp opts.vel.x store result score @s motion.velocity.x run data get storage motion:temp opts.vel.x 1000
execute if data storage motion:temp opts.vel if data storage motion:temp opts.vel.y store result score @s motion.velocity.y run data get storage motion:temp opts.vel.y 1000
execute if data storage motion:temp opts.vel if data storage motion:temp opts.vel.z store result score @s motion.velocity.z run data get storage motion:temp opts.vel.z 1000
execute if data storage motion:temp opts.drag store result score @s motion.drag run data get storage motion:temp opts.drag 1000
execute if data storage motion:temp opts.damp store result score @s motion.damping run data get storage motion:temp opts.damp 1000
execute if data storage motion:temp opts.friction if data storage motion:temp opts.friction.x store result score @s motion.friction.x run data get storage motion:temp opts.friction.x 1000
execute if data storage motion:temp opts.friction if data storage motion:temp opts.friction.y store result score @s motion.friction.y run data get storage motion:temp opts.friction.y 1000
execute if data storage motion:temp opts.friction if data storage motion:temp opts.friction.z store result score @s motion.friction.z run data get storage motion:temp opts.friction.z 1000
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.stop store result score @s motion.cancel.stop run data get storage motion:temp opts.cancel.stop
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.death store result score @s motion.cancel.death run data get storage motion:temp opts.cancel.death
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.ground store result score @s motion.cancel.ground run data get storage motion:temp opts.cancel.ground
execute if data storage motion:temp opts.cancel if data storage motion:temp opts.cancel.speed store result score @s motion.cancel.speed run data get storage motion:temp opts.cancel.speed

execute if data storage motion:temp {opts:{continuity:true}} run function motion:zzz/continuity
execute if data storage motion:temp opts.fall_damage store result score @s motion.fall_damage run data get storage motion:temp opts.fall_damage