
# detect opened door for starting a run
# remember to add score to distinguish wether a player may already be in a dungeon
# execute at @a[gamemode=adventure] if block ~ ~ ~ #minecraft:doors[open=true] run dialog show @p roguelikemc:leave_base

# set gamemode spectator for dead players
# execute as @a[gamemode=adventure] if score @s death matches 1 run function roguelikemc:game_loop/player_death

# mount nearest player
# execute as @a[gamemode=spectator] unless data entity @s RootVehicle{} run ride @s mount @p[gamemode=adventure]

# checks if all players are dead. if so runs custom return to base script
# data modify storage roguelikemc:player_data allPlayersDead set value 1
# execute as @a if score @s death matches 0 store result storage roguelikemc:player_data allPlayersDead int 1 run scoreboard players get @s death
# execute if data storage roguelikemc:player_data {allPlayersDead:1} run function roguelikemc:game_loop/revive_all_players

# execute at @a[gamemode=adventure] if items entity @e[limit=1,distance=..8,type=armor_stand] armor.feet golden_boots run function roguelikemc:game_loop/stage_cleared

#expand dungeon
execute at @a[] as @e[distance=..128,tag=structure_marker,type=minecraft:armor_stand] run function roguelikemc:dungeon/expand/expand
