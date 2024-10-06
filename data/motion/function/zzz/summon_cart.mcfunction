scoreboard players operation $id motion.thread = @s id
execute on vehicle if score @s id = $id motion.thread run return 0

tag @s add motion-thread
scoreboard players operation $id motion.thread = @s id
execute at @s positioned ~ ~0.2 ~ summon minecart run function motion:zzz/tag_cart
tag @s remove motion-thread