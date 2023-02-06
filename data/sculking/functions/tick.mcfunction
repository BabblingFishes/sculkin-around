## DEBUG
execute as @e[tag=sculking.portal] at @s run particle minecraft:scrape ~ ~ ~ 0 0 0 0 1
execute as @e[type=marker] at @s run particle minecraft:cloud ~ ~ ~ 0 0 0 0 1

#TODO make this less frequent
execute as @e[tag=sculking.portal] at @s unless block ~ ~-1 ~ #sculking:portal_frame run function sculking:technical/destroy_portal
execute as @e[tag=sculking.portal] at @s unless block ~ ~-3 ~ #sculking:portal_frame run function sculking:technical/destroy_portal