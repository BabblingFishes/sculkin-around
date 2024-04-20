# I don't feel like making a whole function just to tag the stepper. If you somehow manage to get closer to the shrieker than the actual stepper that's your problem.
tag @p add sculking.stepper

## To avoid issues regarding fence posts and other weird hitboxes, scoot up by 1 block if the lower block is a fence
execute if block ~ ~-1 ~ #sculking:tall_blocks run tp @s ~ ~1 ~

## Store our current position
data modify entity @s data.destination set from entity @s Pos



## Then scoot back home so we can load it
data modify entity @s Pos set from entity @s data.sculking.origin

## Set up error checker
scoreboard players set @s sculking.error_check 0

## Hunt for our matching portal
execute at @s if entity @e[type=marker,tag=sculking.portal,distance=..1,limit=1] run scoreboard players set @s sculking.error_check 1
execute if score @s sculking.error_check matches 1 at @s if score @e[type=marker,tag=sculking.portal,distance=..1,limit=1] sculking.portal_id = @s sculking.portal_id run scoreboard players set @s sculking.error_check 2


## Time for RESULTS

execute if score @s sculking.error_check matches 0 run tellraw @a[tag=sculking.stepper] [{"text":"No portal found...was it destroyed?","color":"red"}]
execute if score @s sculking.error_check matches 1 run tellraw @a[tag=sculking.stepper] [{"text":"Wrong portal found...was a new one built in its place?","color":"red"}]
execute if score @s sculking.error_check matches 0..1 run setblock ~ ~ ~ air destroy

execute if score @s sculking.error_check matches 2 run setblock ~ ~ ~ minecraft:sculk_vein[down=true]

## NOTE: always do this last as we reuse error_check in set_destination!
execute if score @s sculking.error_check matches 2 at @s run function sculking:warp_spore/set_destination

tag @p[tag=sculking.stepper] remove sculking.stepper
kill @s