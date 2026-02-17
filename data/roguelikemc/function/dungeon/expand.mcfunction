execute at @s run setblock ~ ~-1 ~ gold_block
function roguelikemc:helper/rand_int_10
# data modify storage roguelikemc:data tileData.
execute as @s[tag=east,tag=!moved] run function roguelikemc:dungeon/expand_east with storage roguelikemc:data
execute as @s[tag=west,tag=!moved] run function roguelikemc:dungeon/expand_west with storage roguelikemc:data
execute as @s[tag=south,tag=!moved] run function roguelikemc:dungeon/expand_south with storage roguelikemc:data

tag @s remove moved

function roguelikemc:dungeon/place_extras

execute store result storage roguelikemc:data level int 1 run scoreboard players get .data level