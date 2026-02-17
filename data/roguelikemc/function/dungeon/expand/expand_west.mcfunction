
execute at @s run setblock ~-21 ~-1 ~ diamond_block

tag @s remove west
tag @s add moved

# 50% chance for going west
execute if predicate roguelikemc:random_chance_2 run tag @s add west
# if not, go south
execute unless entity @s[tag=west] run tag @s add south

data modify storage roguelikemc:data xPos set value -1
data modify storage roguelikemc:data yPos set value 1
data modify storage roguelikemc:data zPos set value ""
data modify storage roguelikemc:data rot set value "clockwise_90"

# debug
# execute if entity @s[tag=west] run say continuing west
execute if entity @s[tag=west] at @s run function roguelikemc:dungeon/expand/place_straight with storage roguelikemc:data
# execute if entity @s[tag=south] run say turning south
execute if entity @s[tag=south] at @s run function roguelikemc:dungeon/expand/place_left with storage roguelikemc:data

execute at @s run tp @s ~-21 ~ ~