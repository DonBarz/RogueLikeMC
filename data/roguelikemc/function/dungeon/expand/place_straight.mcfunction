# {posX, posY, posZ, rot, level, randInt}

# 10 percent chance for changing the stage
# only possible on straight
execute if predicate roguelikemc:random_chance_10 run tag @s add transition
# execute as @s[tag=transition] run say "Changing to next level!"

# maximum level check level
# currently only 2 :(
execute if score .data level matches 2 run tag @s remove transition

# normal place
$execute as @s[tag=!transition] at @s run place template roguelikemc:level_$(level)/straight_$(randInt) ~$(xPos) ~$(yPos) ~$(zPos) $(rot)
# $execute as @s[tag=!transition] run say Placing tile "level_$(level)/straigth_$(randInt)"
# place transitional tile
$execute as @s[tag=transition] at @s run place template roguelikemc:level_$(level)/transition ~$(xPos) ~$(yPos) ~$(zPos) $(rot)

# change to next level
execute as @s[tag=transition] run scoreboard players add .data level 1