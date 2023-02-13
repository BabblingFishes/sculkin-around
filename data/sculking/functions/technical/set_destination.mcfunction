particle minecraft:scrape ~ ~0.2 ~ 0 0 0 1 20

## Stash these as scores for easy access
execute store result score @s sculking.portal_id run data get entity @s data.sculking.portal_id
execute store result score @s sculking.dim_id run data get entity @s data.sculking.dim_id

## Set up error checker
## (classically 0 should be the good value, but it's easiest to do the reverse here)
scoreboard players set @s sculking.error_check 0

## verify location:
execute if block ~ ~ ~ minecraft:air if block ~ ~1 ~ minecraft:air run scoreboard players set @s sculking.error_check 1
execute if score @s sculking.error_check matches 1 if score @e[type=marker,x=0,tag=sculking.dim_id_ref,limit=1] sculking.dim_id = @s sculking.dim_id run scoreboard players set @s sculking.error_check 2

##TODO: function
execute if score @s sculking.error_check matches 2 run playsound minecraft:block.sculk.place block @a
execute if score @s sculking.error_check matches 2 run setblock ~ ~ ~ minecraft:sculk_shrieker
execute if score @s sculking.error_check matches 2 run particle minecraft:scrape ~ ~0.2 ~ 0 0 0 10 20
execute if score @s sculking.error_check matches 2 run particle minecraft:sculk_charge 0 ~ ~0.75 ~ 0.25 0 0.25 0 10

execute if score @s sculking.error_check matches 0..1 run loot give @a[tag=sculking.key_activator] loot sculking:warp_key

## Store our current position
data modify entity @s data.destination set from entity @s Pos

## Then scoot back home so we can load it
data modify entity @s Pos set from entity @s data.sculking.origin

## Hunt for the portal (+ descriptive error messages)
## TODO slap a tag on our pal if it exists so we can quit checking distance
execute at @s run tag @e[type=marker,tag=sculking.portal,distance=..1,limit=1] add sculking.portal_to_set

execute at @s unless entity @e[type=marker,tag=sculking.portal_to_set] run tellraw @a[tag=sculking.key_activator] [{"text":"No portal found...","color":"red"}]
execute at @s if entity @e[type=marker,tag=sculking.portal_to_set] unless score @e[type=marker,tag=sculking.portal,distance=..1,limit=1] sculking.portal_id = @s sculking.portal_id run tellraw @a[tag=sculking.key_activator] [{"text":"Wrong portal found...was it rebuilt?","color":"red"}]

execute at @s if score @e[type=marker,tag=sculking.portal,distance=..1,limit=1] sculking.portal_id = @s sculking.portal_id run say DEBUG: Portal found!!
execute at @s unless score @e[type=marker,tag=sculking.portal,distance=..1,limit=1] sculking.portal_id = @s sculking.portal_id run say DEBUG: Portal missing!!

##TODO
execute at @s if entity @e[distance=..1,tag=sculking.portal_to_set] run function sculking:technical/set_destination_2

##DEBUG
tellraw @a[tag=sculking.key_activator] [{"text":"Error code: ","color":"aqua"},{"score":{"name":"@s","objective":"sculking.error_check"}},{"text":" :V","color":"aqua"}]

execute at @s run tag @e[type=marker,tag=sculking.portal_to_set] remove sculking.portal_to_set
kill @s
