forceload add 0 0
summon minecraft:marker 0 0 0 {Tags:["sculking.dim_id_ref"]}

# increment the number of total dimensions, then use that new maximum as the ID

scoreboard players add sculking.world sculking.dim_id 1
scoreboard players operation @e[type=minecraft:marker,tag=sculking.dim_id_ref,x=0] sculking.dim_id = sculking.world sculking.dim_id