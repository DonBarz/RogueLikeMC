# reset gammode and tp all players to home base
gamemode adventure @a
tp @a 0.0 -50.0 0.0

# set info title and clear dialog
title @a title {text:"Arrived at home base!", color:"gold", bold:true}
dialog clear @a

# closes both doors
setblock -7 -50 0 minecraft:oak_door[facing=east,half=lower,open=false,hinge=right]
setblock -7 -49 0 minecraft:oak_door[facing=east,half=upper,open=false,hinge=right]
setblock -7 -50 -1 minecraft:oak_door[facing=east,half=lower,open=false,hinge=left]
setblock -7 -49 -1 minecraft:oak_door[facing=east,half=upper,open=false,hinge=left]

# clear area
function roguelikemc:dungeon/clear_area
kill @e[distance=..256, type=item]
kill @e[distance=..256, type=item_display]

# heal players
effect give @a minecraft:saturation 10 1 true