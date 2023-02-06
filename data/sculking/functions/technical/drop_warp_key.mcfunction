say DEBUG: Dropping warp key.

execute as @e[type=minecraft:marker,tag=sculking.new_portal] at @s run loot spawn ~ ~-4 ~ loot sculking:warp_key

tag @e[type=marker,tag=sculking.new_portal] remove sculking.new_portal

schedule clear sculking:technical/drop_warp_key