data modify storage id:io in set value {data:{}}
loot replace entity 0-0-0-0-0 armor.head loot id:head
data modify storage id:io in.UUID set from entity @s UUID
data modify storage id:io in.name set from entity 0-0-0-0-0 ArmorItems[-1].components.minecraft:profile.name
item replace entity 0-0-0-0-0 armor.head with air
$data modify storage id:$(id) data set from storage id:io in.data
$data modify storage id:$(id) UUID set from storage id:io in.UUID
$data modify storage id:$(id) name set from storage id:io in.name