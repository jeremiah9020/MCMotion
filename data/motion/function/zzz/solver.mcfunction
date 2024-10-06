$data modify storage motion:temp item set value $(item)

# Duration! (Check only if started up)
execute store result score duration motion.thread run data get storage motion:temp item.duration 1
execute if score @s motion.start matches 0 if score duration motion.thread matches 1.. run scoreboard players remove duration motion.thread 1
execute if score @s motion.start matches 0 store result storage array:io item.duration int 1 run scoreboard players get duration motion.thread

# Acceleration! (Contains 3 digits of precision, but is applied 1/20 of a second)
execute store result score ax motion.thread run data get storage motion:temp item.ax 50
execute store result score ay motion.thread run data get storage motion:temp item.ay 50
execute store result score az motion.thread run data get storage motion:temp item.az 50

# Velocities!
execute unless score duration motion.thread matches 0 run scoreboard players operation @s motion.velocity.x += ax motion.thread
execute unless score duration motion.thread matches 0 run scoreboard players operation @s motion.velocity.y += ay motion.thread
execute unless score duration motion.thread matches 0 run scoreboard players operation @s motion.velocity.z += az motion.thread

# Finish!
execute if score @s motion.start matches 0 if score duration motion.thread matches 0 run return run data remove storage array:io item
