advancement revoke @s only sculking:technical/use_spore
tag @s add sculking.spore_activator
execute as @e[type=marker,tag=sculking.new_destination,sort=nearest,limit=1] at @s run function sculking:warp_spore/spore_checks
tag @s remove sculking.spore_activator
