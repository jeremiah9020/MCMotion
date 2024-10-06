scoreboard players set @s motion.active 0
execute on vehicle if entity @s[tag=motion-cart] run kill @s

tag @s remove motion.mode.creative_flight
tag @s remove motion.mode.player