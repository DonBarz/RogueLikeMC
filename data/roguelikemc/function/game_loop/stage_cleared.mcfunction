#
title @a subtitle {text:"Stage successfully cleared!", color:gold}
execute as @e[limit=1,distance=..128,type=armor_stand] if items entity @s armor.feet golden_boots run kill
#
function roguelikemc:game_loop/return_to_base