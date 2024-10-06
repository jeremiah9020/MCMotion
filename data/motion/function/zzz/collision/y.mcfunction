execute if score @s motion.velocity.y matches 1.. positioned ~ ~0.5 ~ run function #motion_collision_y
execute if score @s motion.velocity.y matches ..-1 positioned ~ ~-0.5 ~ run function #motion_collision_y

scoreboard players operation @s motion.velocity.y *= -1 const
scoreboard players operation @s motion.velocity.y *= @s motion.damping
scoreboard players operation @s motion.velocity.y /= 1000 const

scoreboard players operation @s motion.velocity.x *= @s motion.friction.y
scoreboard players operation @s motion.velocity.x /= 1000 const
scoreboard players operation @s motion.velocity.z *= @s motion.friction.y
scoreboard players operation @s motion.velocity.z /= 1000 const
