gamemode adventure @a
gamerule immediate_respawn true
# gamerule keep_inventory true
gamerule mob_griefing false

setworldspawn 0 -50 0
gamerule respawn_radius 0

# gamerule advance_time false
# time set 1000
# gamerule advance_weather false
# weather clear

place template roguelikemc:base -28 -57 -25
tp @a 0.0 -50.0 0.0

# set initialized so this script isn't repeated
scoreboard players set .data init 1

# store player status for multiplayer integration
scoreboard objectives add death deathCount isDead
# 0 = alive
# 1 => dead, spectating until return to base
# not yet tested (no friends :()
scoreboard players set @a death 0

#
data modify storage roguelikemc:trader_data level_1 set value {data:{VillagerData:{profession:nitwit,level:99,type:swamp},Invulnerable:1,PersistenceRequired:1,Silent:1,Offers:{Recipes:[{buy:{id:trial_key,count:3},buyB:{id:emerald,count:16},sell:{id:ominous_trial_key,count:1,components:{custom_name:"Undead Crypt Key",lore:["Use to unlock the undead crypt, located in the mines."]}},rewardExp:0b,maxUses:1},{buy:{id:emerald,count:8},sell:{id:pumpkin_pie,count:4},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,count:24},sell:{id:copper_sword,count:1,components:{enchantments:{smite:2,vanishing_curse:1}}},rewardExp:0b,maxUses:4},{buy:{id:emerald,count:32},sell:{id:chainmail_chestplate,count:1,components:{enchantments:{thorns:1,unbreaking:1}}},rewardExp:0b,maxUses:4},{buy:{id:emerald,count:64},sell:{id:golden_sword,count:1,components:{enchantments:{bane_of_arthropods:5,unbreaking:2}}},rewardExp:0b,maxUses:4}]}}}