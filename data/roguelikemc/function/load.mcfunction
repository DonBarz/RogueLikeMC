scoreboard objectives add init dummy isInitialized

execute unless score .data init matches 1 run function roguelikemc:logic/initialize

title @a title {"text":"Welcome to RogueLikeMC!","color":"gold","bold":true}
title @a subtitle {"text":"Exit the base to start a dungeon run!"}
tellraw @a {"text":"RogueLikeMC datapack successfully loaded!","color":"green"}
