tag @s remove sculking.new_destination

particle minecraft:scrape ~ ~0.2 ~ 0 0 0 1 20

## Stash these as scores for easy access
execute store result score @s sculking.portal_id run data get entity @s data.sculking.portal_id
execute store result score @s sculking.dim_id run data get entity @s data.sculking.dim_id

## Set up error spore_checks
## (classically 0 should be the good value, but it's easiest to do the reverse here)
scoreboard players set @s sculking.error_check 0

## Verify location
execute if score @e[type=marker,x=0,tag=sculking.dim_id_ref,limit=1] sculking.dim_id = @s sculking.dim_id run scoreboard players set @s sculking.error_check 1
execute if score @s sculking.error_check matches 1 if block ~ ~ ~ minecraft:air if block ~ ~1 ~ minecraft:air run scoreboard players set @s sculking.error_check 2


## RESULTS

execute if score @s sculking.error_check matches 0 run tellraw @a[tag=sculking.spore_activator] [{"text":"Wrong dimension for this spore...","color":"red"}]
execute if score @s sculking.error_check matches 1 run tellraw @a[tag=sculking.spore_activator] [{"text":"Not enough space for this spore...","color":"red"}]
execute if score @s sculking.error_check matches 0..1 run loot give @a[tag=sculking.spore_activator] loot sculking:warp_spore
execute if score @s sculking.error_check matches 0..1 run kill @s

##TODO: function
execute if score @s sculking.error_check matches 2 run playsound minecraft:block.sculk.place block @a ~ ~ ~
execute if score @s sculking.error_check matches 2 run setblock ~ ~ ~ minecraft:sculk_shrieker
execute if score @s sculking.error_check matches 2 run particle minecraft:scrape ~ ~0.2 ~ 0 0 0 10 20
execute if score @s sculking.error_check matches 2 run particle minecraft:sculk_charge 0 ~ ~0.75 ~ 0.25 0 0.25 0 10


