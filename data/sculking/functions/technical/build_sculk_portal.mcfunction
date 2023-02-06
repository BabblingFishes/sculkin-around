summon minecraft:marker ~ ~ ~ {Tags:["sculking.portal","sculking.new_portal"]}


# assign marker portal id

scoreboard players add sculking.world sculking.portal_id 1

scoreboard players operation @e[type=minecraft:marker,tag=sculking.new_portal,sort=nearest,limit=1] sculking.portal_id = sculking.world sculking.portal_id


# assign marker dimension id

execute unless entity @e[type=minecraft:marker,tag=sculking.dim_id_ref,x=0] run function sculking:technical/make_new_dim_id

scoreboard players operation @e[type=minecraft:marker,tag=sculking.new_portal,sort=nearest,limit=1] sculking.dim_id = @e[type=marker,tag=sculking.dim_id_ref,x=0] sculking.dim_id


# tag marker with dimension id
# NOTE: this can be done as part of the above operation by setting scale to 0.5 but this is more readable and I don't trust like that

execute store result entity @e[type=minecraft:marker,tag=sculking.new_portal,sort=nearest,limit=1] data.sculking.dim_id int 1 run scoreboard players get sculking.world sculking.dim_id

setblock ~ ~ ~ minecraft:end_rod[facing=up]
setblock ~ ~-1 ~ minecraft:polished_blackstone_brick_wall
setblock ~ ~-2 ~ minecraft:end_gateway{ExactTeleport:true}
setblock ~ ~-3 ~ minecraft:polished_blackstone_brick_wall
setblock ~ ~-4 ~ minecraft:end_rod[facing=down]

summon minecraft:lightning_bolt ~ ~-1 ~
# playsound minecraft:entity.lightning_bolt.impact block @a ~ ~ ~ 4 1.5
# playsound minecraft:entity.lightning_bolt.thunder block @a ~ ~ ~ 4 1
particle minecraft:explosion ~ ~-2 ~ 0 0 0 1 1
particle minecraft:sonic_boom ~ ~ ~
particle minecraft:scrape ~ ~-2 ~ 1 2 1 10 20

# we have to schedule this so the lightning doesn't destroy the key
schedule function sculking:technical/drop_warp_key 1s append