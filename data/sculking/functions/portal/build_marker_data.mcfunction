## Assign portal id

scoreboard players add sculking.world sculking.portal_id 1

scoreboard players operation @s sculking.portal_id = sculking.world sculking.portal_id


## Assign dimension id

execute unless entity @e[type=minecraft:marker,tag=sculking.dim_id_ref,x=0] run function sculking:portal/make_new_dim_id

scoreboard players operation @s sculking.dim_id = @e[type=minecraft:marker,tag=sculking.dim_id_ref,x=0] sculking.dim_id


## Copy necessary information to NBT
## - this is used for the warp spore loot table and doubles as a handy backup just in case
## NOTE: this can technically be done as part of the above operation by setting scale to 0.5 but this is way more readable and I don't trust mojang not to change that at some point

execute store result entity @s data.sculking.portal_id int 1 run scoreboard players get @s sculking.portal_id
execute store result entity @s data.sculking.dim_id int 1 run scoreboard players get @s sculking.dim_id
data modify entity @s data.sculking.origin set from entity @s Pos

## We'll also stash this info in storage for admin use
data modify storage sculking portals append from entity @s data.sculking
