
execute at @s run setblock ~21 ~-1 ~ diamond_block

tag @s remove east
tag @s add moved

# 50% chance for going east
execute if predicate roguelikemc:random_chance_2 run tag @s add east
# if not, go south
execute unless entity @s[tag=east] run tag @s add south

data modify storage roguelikemc:data xPos set value 21
data modify storage roguelikemc:data yPos set value 1
data modify storage roguelikemc:data zPos set value 20
data modify storage roguelikemc:data rot set value "counterclockwise_90"

# debug
# execute if entity @s[tag=east] run say continuing east
execute if entity @s[tag=east] at @s run function roguelikemc:dungeon/place_straight with storage roguelikemc:data
# execute if entity @s[tag=south] run say turning south
execute if entity @s[tag=south] at @s run function roguelikemc:dungeon/place_right with storage roguelikemc:data

execute at @s run tp @s ~21 ~ ~