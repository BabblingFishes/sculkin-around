advancement revoke @s only sculking:technical/place_key
tag @s add sculking.key_activator
execute as @e[type=marker,tag=sculking.destination,sort=nearest,limit=1] at @s run function sculking:technical/set_destination
tag @s remove sculking.key_activator
