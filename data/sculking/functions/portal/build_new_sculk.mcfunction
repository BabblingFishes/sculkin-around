summon minecraft:marker ~ ~ ~ {Tags:["sculking.portal","sculking.new_portal"]}

execute as @e[type=minecraft:marker,tag=sculking.new_portal,sort=nearest,limit=1] run function sculking:portal/build_marker_data

setblock ~ ~ ~ minecraft:end_rod[facing=up]
setblock ~ ~-1 ~ minecraft:blackstone_wall
setblock ~ ~-2 ~ minecraft:end_gateway{ExactTeleport:true}
setblock ~ ~-3 ~ minecraft:blackstone_wall
setblock ~ ~-4 ~ minecraft:end_rod[facing=down]

#playsound minecraft:entity.wither.death block @a ~ ~ ~ 4 2
playsound minecraft:entity.warden.tendril_clicks block @a ~ ~ ~ 4 1
playsound minecraft:entity.warden.tendril_clicks block @a ~ ~ ~ 4 0.5
playsound minecraft:entity.warden.tendril_clicks block @a ~ ~ ~ 4 0.1
summon minecraft:lightning_bolt ~ ~-1 ~
particle minecraft:explosion ~ ~-2 ~ 0 0 0 1 1
particle minecraft:sonic_boom ~ ~-2 ~
particle minecraft:scrape ~ ~-2 ~ 1 2 1 10 50

execute as @e[type=minecraft:marker,tag=sculking.new_portal] at @s run loot spawn ~ ~-4 ~ loot sculking:warp_spore
execute as @e[type=minecraft:marker,tag=sculking.new_portal] at @s positioned ~ ~-4 ~ run data modify entity @e[type=minecraft:item,distance=..1,limit=1,nbt={Item:{id:"minecraft:warden_spawn_egg"}}] Invulnerable set value 1b

tag @e[type=marker,tag=sculking.new_portal] remove sculking.new_portal
