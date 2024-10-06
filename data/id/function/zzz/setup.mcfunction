scoreboard players operation @s id = $latest id
tag @s add id.tagged
scoreboard players add $latest id 1

execute store result storage id:io id int 1 run scoreboard players get @s id
function id:zzz/init with storage id:io