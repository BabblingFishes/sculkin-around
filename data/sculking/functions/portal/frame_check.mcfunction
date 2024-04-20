## TODO: Also check areas of the barrel that should be empty

scoreboard players set @s sculking.error_check 10

## Make sure we aren't too close to another portal
execute unless entity @e[type=marker,distance=..1.5,tag=sculking.portal] run scoreboard players set @s sculking.error_check 11


## What's in the frame?
## TODO: make predicates of these
## - Sculk
execute if score @s sculking.error_check matches 11 if block ~ ~-2 ~ minecraft:barrel{Items: [{Slot: 13b, id: "minecraft:sculk", Count: 64b}]} run scoreboard players set @s sculking.error_check 20
## - Echo Shard
execute if score @s sculking.error_check matches 11 if block ~ ~-2 ~ minecraft:barrel{Items: [{Slot: 13b, id: "minecraft:echo_shard", Count: 1b}]} run scoreboard players set @s sculking.error_check 21
## - Warp Spore -- (TODO when you make a predicate of this, add the unique tags)
execute if score @s sculking.error_check matches 11 if block ~ ~-2 ~ minecraft:barrel{Items: [{Slot: 13b, id: "minecraft:warden_spawn_egg", Count: 1b}]} run scoreboard players set @s sculking.error_check 22



## RESULTS

execute if score @s sculking.error_check matches 10 run tellraw @s [{"text":"This portal is too close to another.","color":"red"}]
execute if score @s sculking.error_check matches 11 run tellraw @s [{"text":"This portal frame needs a stable core.","color":"red"}]
execute if score @s sculking.error_check matches 10..11 align xyz positioned ~0.5 ~0.5 ~0.5 run playsound minecraft:entity.bee.sting block @a ~ ~ ~ 4 0.1
execute if score @s sculking.error_check matches 10..11 align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:large_smoke ~ ~0.5 ~ 0.1 0.3 0.1 0 15
execute if score @s sculking.error_check matches 10..11 align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:electric_spark ~ ~ ~ 0.1 0.3 0.1 0.01 10

# build portal
execute if score @s sculking.error_check matches 20 align xyz positioned ~0.5 ~0.5 ~0.5 run function sculking:portal/build_new_sculk

execute if score @s sculking.error_check matches 21 align xyz positioned ~0.5 ~0.5 ~0.5 run function sculking:portal/build_new_echo

execute if score @s sculking.error_check matches 22 align xyz positioned ~0.5 ~0.5 ~0.5 run function sculking:portal/build_new_spore


