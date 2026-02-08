# {type:Path,length:_3/_4/_5}

# title everyone the new position
# should be replaced by translatable
title @a title {text:"Arrived at dungeon!",color:"dark_gray",bold:1b}
title @a subtitle {text:""}

# go to random nearby position
# is required to generate random dungeons since thats chunk-based
# also needs to be a loaded chunk to work
spreadplayers 0 0 0 128 false @s

# place the structure
$execute at @s run place structure roguelikemc:$(type)_3 ~ ~ ~

# destroy items that may still be scattered from previous dungeons
kill @e[distance=..256, type=item]

# tp all players to dungeon entrance
execute at @s run tp ~ 0 ~
execute at @s as @e[distance=..512, type=minecraft:armor_stand] if items entity @s armor.head golden_helmet run tp @a @s
execute at @s as @e[limit=1, distance=..2, type=armor_stand] if items entity @s armor.head golden_helmet run kill @s

# give starter kit to players without any gear
execute as @a unless data entity @s Inventory[] run loot give @s loot roguelikemc:starter_kit

# spawn traders
$execute as @e[distance=..256, type=armor_stand] if items entity @s armor.head chainmail_helmet run function roguelikemc:dungeon/summon_villager with storage roguelikemc:trader_data $(type)