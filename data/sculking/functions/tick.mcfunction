## DEBUG
#execute as @e[type=marker] at @s run particle minecraft:cloud ~ ~ ~ 0 0 0 0 1

#TODO make this less frequent
execute as @e[tag=sculking.portal] at @s unless block ~ ~-1 ~ #sculking:portal_frame run function sculking:portal/destroy
execute as @e[tag=sculking.portal] at @s unless block ~ ~-3 ~ #sculking:portal_frame run function sculking:portal/destroy
execute as @e[tag=sculking.destination] at @s unless entity @p[distance=..10] run function sculking:warp_spore/destroy_shrieker
execute as @e[tag=sculking.destination] at @s unless block ~ ~ ~ minecraft:sculk_shrieker run function sculking:warp_spore/destroy_shrieker
