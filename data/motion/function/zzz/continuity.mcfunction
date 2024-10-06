
scoreboard players operation vx motion.thread = @s motion.vx
scoreboard players operation vy motion.thread = @s motion.vy
scoreboard players operation vz motion.thread = @s motion.vz
scoreboard players operation vx motion.thread *= 20 const
scoreboard players operation vy motion.thread *= 20 const
scoreboard players operation vz motion.thread *= 20 const
scoreboard players operation @s motion.velocity.x += vx motion.thread
scoreboard players operation @s motion.velocity.y += vy motion.thread
scoreboard players operation @s motion.velocity.z += vz motion.thread
