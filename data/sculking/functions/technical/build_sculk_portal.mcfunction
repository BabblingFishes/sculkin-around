summon minecraft:marker ~ ~ ~ {Tags:["sculking.portal","sculking.new_portal"]}

execute as @e[type=minecraft:marker,tag=sculking.new_portal,sort=nearest,limit=1] run function sculking:technical/build_portal_data

setblock ~ ~ ~ minecraft:end_rod[facing=up]
setblock ~ ~-1 ~ minecraft:blackstone_wall
setblock ~ ~-2 ~ minecraft:end_gateway{ExactTeleport:true}
setblock ~ ~-3 ~ minecraft:blackstone_wall
setblock ~ ~-4 ~ minecraft:end_rod[facing=down]

summon minecraft:lightning_bolt ~ ~-1 ~
# playsound minecraft:entity.lightning_bolt.impact block @a ~ ~ ~ 4 1.5
# playsound minecraft:entity.lightning_bolt.thunder block @a ~ ~ ~ 4 1
particle minecraft:explosion ~ ~-2 ~ 0 0 0 1 1
particle minecraft:sonic_boom ~ ~ ~
particle minecraft:scrape ~ ~-2 ~ 1 2 1 10 20

execute as @e[type=minecraft:marker,tag=sculking.new_portal] at @s run loot spawn ~ ~-4 ~ loot sculking:warp_key
execute as @e[type=minecraft:marker,tag=sculking.new_portal] at @s run data modify entity @e[type=minecraft:item,distance=..5,limit=1] Invulnerable set value 1b

tag @e[type=marker,tag=sculking.new_portal] remove sculking.new_portal
