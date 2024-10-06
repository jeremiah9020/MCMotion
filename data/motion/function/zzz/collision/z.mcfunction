function #motion_collision_z

scoreboard players operation @s motion.velocity.z *= -1 const
scoreboard players operation @s motion.velocity.z *= @s motion.damping
scoreboard players operation @s motion.velocity.z /= 1000 const

scoreboard players operation @s motion.velocity.x *= @s motion.friction.z
scoreboard players operation @s motion.velocity.x /= 1000 const
scoreboard players operation @s motion.velocity.y *= @s motion.friction.z
scoreboard players operation @s motion.velocity.y /= 1000 const