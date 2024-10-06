execute if entity @s[tag=motion.mode.creative_flight] run function motion:add_force/creative_flight
execute if entity @s[tag=motion.mode.player] run function motion:add_force/player

execute if score @s motion.fall_damage matches 0 on vehicle run data modify entity @s FallDistance set value 0f

# Tracking velocity for continuity
scoreboard players operation @s motion.lx = @s motion.x
scoreboard players operation @s motion.ly = @s motion.y
scoreboard players operation @s motion.lz = @s motion.z
execute store result score @s motion.x run data get entity @s Pos[0] 1000
execute store result score @s motion.y run data get entity @s Pos[1] 1000
execute store result score @s motion.z run data get entity @s Pos[2] 1000
scoreboard players operation @s motion.vx = @s motion.x
scoreboard players operation @s motion.vy = @s motion.y
scoreboard players operation @s motion.vz = @s motion.z
scoreboard players operation @s motion.vx -= @s motion.lx
scoreboard players operation @s motion.vy -= @s motion.ly
scoreboard players operation @s motion.vz -= @s motion.lz

# Activation!
execute if score @s motion.active matches 0 run return 0

# Carts!
function motion:zzz/put_player_in_cart

# Collisions!
execute on vehicle store result score actual.vx motion.thread run data get entity @s Motion[0] 21053
execute on vehicle store result score actual.vy motion.thread run data get entity @s Motion[1] 21053
execute on vehicle store result score actual.vz motion.thread run data get entity @s Motion[2] 21053
execute if score @s motion.start matches 0 if score @s motion.velocity.y matches ..-1 if score actual.vy motion.thread matches 1.. run function motion:zzz/collision/y
execute if score @s motion.start matches 0 if score actual.vx motion.thread matches 0 unless score @s motion.velocity.x matches 0 run function motion:zzz/collision/x
execute if score @s motion.start matches 0 if score actual.vy motion.thread matches 0 unless score @s motion.velocity.y matches 0 run function motion:zzz/collision/y
execute if score @s motion.start matches 0 if score actual.vz motion.thread matches 0 unless score @s motion.velocity.z matches 0 run function motion:zzz/collision/z
execute if score actual.vy motion.thread matches 0.. on vehicle run data modify entity @s FallDistance set value 0f



# Forces!
function id:get/executor
data modify storage motion:temp function set value "motion:zzz/solver"
data modify storage motion:temp array set from storage id:io out.motion
function array:foreach with storage motion:temp
data modify storage id:io in set from storage id:io out
data modify storage id:io in.motion set from storage array:io out
function id:set/executor

# Max Speed!
execute if score @s motion.velocity.x matches 198000.. run scoreboard players set @s motion.velocity.x 198000
execute if score @s motion.velocity.x matches ..-198000 run scoreboard players set @s motion.velocity.x -198000
execute if score @s motion.velocity.y matches 198000.. run scoreboard players set @s motion.velocity.y 198000
execute if score @s motion.velocity.y matches ..-198000 run scoreboard players set @s motion.velocity.y -198000
execute if score @s motion.velocity.z matches 198000.. run scoreboard players set @s motion.velocity.z 198000
execute if score @s motion.velocity.z matches ..-198000 run scoreboard players set @s motion.velocity.z -198000

# Drag!
execute if score @s motion.drag matches ..999 if score @s motion.velocity.x matches ..-1 run scoreboard players add @s motion.velocity.x 1
execute if score @s motion.drag matches ..999 if score @s motion.velocity.y matches ..-1 run scoreboard players add @s motion.velocity.y 1
execute if score @s motion.drag matches ..999 if score @s motion.velocity.z matches ..-1 run scoreboard players add @s motion.velocity.z 1
scoreboard players operation @s motion.velocity.x *= @s motion.drag
scoreboard players operation @s motion.velocity.y *= @s motion.drag
scoreboard players operation @s motion.velocity.z *= @s motion.drag
scoreboard players operation @s motion.velocity.x /= 1000 const
scoreboard players operation @s motion.velocity.y /= 1000 const
scoreboard players operation @s motion.velocity.z /= 1000 const

# Gravity Neutralizer!
scoreboard players operation vx motion.thread = @s motion.velocity.x
scoreboard players operation vy motion.thread = @s motion.velocity.y
scoreboard players operation vz motion.thread = @s motion.velocity.z
scoreboard players add vy motion.thread 800

# Motion!
execute store result storage motion:io Motion[0] double 0.00005 run scoreboard players get vx motion.thread
execute store result storage motion:io Motion[1] double 0.00005 run scoreboard players get vy motion.thread
execute store result storage motion:io Motion[2] double 0.00005 run scoreboard players get vz motion.thread
execute on vehicle run data modify entity @s Motion set from storage motion:io Motion

# Start Timer!
execute if score @s motion.start matches 1.. run scoreboard players remove @s motion.start 1

# Stopping Conditions!
execute if score @s motion.cancel.death matches 1 unless data entity @s {DeathTime:0s} run function motion:stop
execute unless score @s motion.stop matches 0 run scoreboard players remove @s motion.stop 1
execute if score @s motion.cancel.stop matches 1 if score actual.vx motion.thread matches 0 if score actual.vy motion.thread matches 0 if score actual.vz motion.thread matches 0 run scoreboard players add @s motion.stop 2
execute if score @s motion.cancel.ground matches 1 if score actual.vy motion.thread matches 0.. if score @s motion.velocity.y matches ..-1 run scoreboard players add @s motion.stop 2
execute unless score @s motion.cancel.speed matches -1 if score vx motion.thread matches ..-1 run scoreboard players operation vx motion.thread *= -1 const
execute unless score @s motion.cancel.speed matches -1 if score vy motion.thread matches ..-1 run scoreboard players operation vy motion.thread *= -1 const
execute unless score @s motion.cancel.speed matches -1 if score vz motion.thread matches ..-1 run scoreboard players operation vz motion.thread *= -1 const
execute unless score @s motion.cancel.speed matches -1 if score vx motion.thread <= @s motion.cancel.speed if score vy motion.thread <= @s motion.cancel.speed if score vz motion.thread <= @s motion.cancel.speed run scoreboard players add @s motion.stop 2
execute if score @s motion.stop matches 5.. run function motion:stop
