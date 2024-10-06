data modify storage array:io out set value []

$data modify storage array:temp array set value $(array)
$data modify storage array:temp function set value "$(function)"
execute store result score length array.thread run data get storage array:temp array
scoreboard players set index array.thread 0 
execute store result storage array:temp index int 1 run scoreboard players get index array.thread
execute if score index array.thread < length array.thread run function array:zzz/foreach with storage array:temp
