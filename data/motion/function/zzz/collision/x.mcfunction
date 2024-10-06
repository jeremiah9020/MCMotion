function #motion_collision_x

scoreboard players operation @s motion.velocity.x *= -1 const
scoreboard players operation @s motion.velocity.x *= @s motion.damping
scoreboard players operation @s motion.velocity.x /= 1000 const

scoreboard players operation @s motion.velocity.y *= @s motion.friction.x
scoreboard players operation @s motion.velocity.y /= 1000 const
scoreboard players operation @s motion.velocity.z *= @s motion.friction.x
scoreboard players operation @s motion.velocity.z /= 1000 const