scoreboard objectives add motion.active dummy
scoreboard objectives add motion.velocity.x dummy
scoreboard objectives add motion.velocity.y dummy
scoreboard objectives add motion.velocity.z dummy
scoreboard objectives add motion.friction.x dummy
scoreboard objectives add motion.friction.y dummy
scoreboard objectives add motion.friction.z dummy
scoreboard objectives add motion.drag dummy
scoreboard objectives add motion.damping dummy
scoreboard objectives add motion.cancel.stop dummy
scoreboard objectives add motion.cancel.death dummy
scoreboard objectives add motion.cancel.ground dummy
scoreboard objectives add motion.cancel.speed dummy
scoreboard objectives add motion.start dummy
scoreboard objectives add motion.stop dummy

scoreboard objectives add motion.vx dummy
scoreboard objectives add motion.vy dummy
scoreboard objectives add motion.vz dummy
scoreboard objectives add motion.x dummy
scoreboard objectives add motion.y dummy
scoreboard objectives add motion.z dummy
scoreboard objectives add motion.lx dummy
scoreboard objectives add motion.ly dummy
scoreboard objectives add motion.lz dummy

scoreboard objectives add motion.thread dummy
scoreboard objectives add const dummy
scoreboard players set -1 const -1
scoreboard players set 2 const 2
scoreboard players set 3 const 3
scoreboard players set 1000 const 1000

# Reloading stops motion, this fixes that!
scoreboard players set @a motion.start 2

data modify storage motion:io Motion set value [0d,0d,0d]


execute store result score enabled motion.thread run function motion:zzz/gamerule
execute unless score enabled motion.thread matches 11 run tellraw @a ["",{"color": "red", "text":"[ERROR]"},{"text": " You're probably on the wrong version, motion max speed will be very limited"}]