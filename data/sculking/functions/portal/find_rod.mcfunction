## This is a raycast from the player to the lightning rod they placed
## NOTE: Ensure score @s sculking.error_check is set to 0 before calling this function!!

## Check if we're out of range
execute if score @s sculking.error_check matches 0 unless entity @s[distance=..7] run scoreboard players set @s sculking.error_check 1

## Check if we've found a lightning rod
execute if score @s sculking.error_check matches 0 if block ^ ^ ^ minecraft:lightning_rod run scoreboard players set @s sculking.error_check 2


## RESULTS

# nothing found :c (Debug only)
#execute if score @s sculking.error_check matches 1 run say DEBUG: Couldn't find lightning rod...

# build portal
execute if score @s sculking.error_check matches 2 align xyz if predicate sculking:portal_blank if block ~ ~-2 ~ minecraft:barrel{Items: [{Slot: 13b, id: "minecraft:sculk", Count: 64b}]} positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,distance=..1.5,tag=sculking.portal] run function sculking:portal/build_new_sculk

# loop
## NOTE: Always do this last or else everything after this statement will execute for every loop!
execute if score @s sculking.error_check matches 0 positioned ^ ^ ^0.25 run function sculking:portal/find_rod

##TODO insert recipes
##TODO add error message or weird sound if middle item is wrong?



#execute if entity @s[distance=..7] if block ^ ^ ^ minecraft:lightning_rod align xyz if block ~ ~-1 ~ minecraft:stone_brick_wall if block ~ ~-3 ~ minecraft:stone_brick_wall if block ~ ~-4 ~ minecraft:lightning_rod[facing=down] if block ~ ~-2 ~ minecraft:barrel{Items: [{Slot: 3b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 4b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 5b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 9b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 10b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 11b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 12b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 13b, id: "minecraft:sculk", Count: 64b}, {Slot: 14b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 15b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 16b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 17b, id: "minecraft:copper_ingot", Count: 1b}, {Slot: 21b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 22b, id: "minecraft:amethyst_shard", Count: 1b}, {Slot: 23b, id: "minecraft:amethyst_shard", Count: 1b}]} positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,distance=..1.5,tag=sculking.portal] run function sculking:portal/build_new_sculk
