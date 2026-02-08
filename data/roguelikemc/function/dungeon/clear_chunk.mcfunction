# {xPos:0,zPos:0,dxPos:15,dzPos:15}

# clears 1 chunk of the playable area
$fill $(xPos) 0 $(zPos) $(dxPos) 100 $(dzPos) air
$fill $(xPos) 100 $(zPos) $(dxPos) 200 $(dzPos) air

# debug
# might enhance this if i find time to
function roguelikemc:logic/show_loading_screen

# moves x coordinates by a chunk
scoreboard players add .data xPos 16
scoreboard players add .data dxPos 16

# if x coordinates are on the other end of the playable area
#   move z coordinates by a chunk
#   reset x coordinates
execute if score .data xPos matches 128 run scoreboard players add .data zPos 16
execute if score .data xPos matches 128 run scoreboard players add .data dzPos 16
execute if score .data xPos matches 128 run scoreboard players set .data dxPos -113
execute if score .data xPos matches 128 run scoreboard players set .data xPos -128

# stop if area is fully cleared
execute if score .data zPos matches 128 run return run title @a actionbar {"text":""}

# reset nbt data then convert scores into stored nbt data
data remove storage roguelikemc:data xPos
data remove storage roguelikemc:data dxPos
data remove storage roguelikemc:data zPos
data remove storage roguelikemc:data dzPos

execute store result storage roguelikemc:data xPos int 1 run scoreboard players get .data xPos
execute store result storage roguelikemc:data dxPos int 1 run scoreboard players get .data dxPos
execute store result storage roguelikemc:data zPos int 1 run scoreboard players get .data zPos
execute store result storage roguelikemc:data dzPos int 1 run scoreboard players get .data dzPos

# recursively run with the newly generated nbt data
function roguelikemc:dungeon/clear_chunk with storage roguelikemc:data