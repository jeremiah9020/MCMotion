$data modify storage array:io item set from storage array:temp array[$(index)]
$function $(function) with storage array:io

execute if data storage array:io item run data modify storage array:io out append from storage array:io item

scoreboard players add index array.thread 1
execute store result storage array:temp index int 1 run scoreboard players get index array.thread

execute if score index array.thread < length array.thread run function array:zzz/foreach with storage array:temp