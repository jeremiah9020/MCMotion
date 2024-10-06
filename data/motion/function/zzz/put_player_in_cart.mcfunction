scoreboard players operation $id motion.thread = @s id
execute on vehicle if score @s id = $id motion.thread run return 0

tag @s add motion-thread
execute as @e[type=minecart,tag=motion-cart] if score @s id = $id motion.thread run ride @p[tag=motion-thread] mount @s
tag @s remove motion-thread




