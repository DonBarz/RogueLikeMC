
execute at @s run setblock ~ ~-1 ~21 diamond_block

tag @s remove south
tag @s add moved

# 33% chance for going south
execute if predicate roguelikemc:random_chance_3 run tag @s add south
# if not, 50% chance for going east
execute if entity @s[tag=!south] if predicate roguelikemc:random_chance_2 run tag @s add east
# if not, go west
execute if entity @s[tag=!east, tag=!south] run tag @s add west

data modify storage roguelikemc:data xPos set value ""
data modify storage roguelikemc:data yPos set value 1
data modify storage roguelikemc:data zPos set value 21
data modify storage roguelikemc:data rot set value "none"

# debug
# execute if entity @s[tag=south] run say continuing south
execute if entity @s[tag=south] at @s run function roguelikemc:dungeon/expand/place_straight with storage roguelikemc:data
# execute if entity @s[tag=east] run say turning east
execute if entity @s[tag=east] at @s run function roguelikemc:dungeon/expand/place_left with storage roguelikemc:data
# execute if entity @s[tag=west] run say turning west
execute if entity @s[tag=west] at @s run function roguelikemc:dungeon/expand/place_right with storage roguelikemc:data

execute at @s run tp @s ~ ~ ~21