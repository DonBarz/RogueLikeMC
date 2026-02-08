# script to clear a 16 x 16 chunk area around the spawn
# simulation distance of >= 8 needed

# instantiate variable objectives
scoreboard objectives add xPos dummy xPos
scoreboard objectives add zPos dummy yPos
scoreboard objectives add dxPos dummy dxPos
scoreboard objectives add dzPos dummy dyPos

function roguelikemc:dungeon/reset_variables

# start recursion at start coordinates
function roguelikemc:dungeon/clear_chunk {xPos:-128,dxPos:-113,zPos:-128,dzPos:-113}