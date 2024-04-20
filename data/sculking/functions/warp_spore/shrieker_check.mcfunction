advancement revoke @s only sculking:technical/step_n_shriek
execute as @e[type=marker,distance=..0.9,tag=sculking.destination,sort=nearest,limit=1] at @s run function sculking:warp_spore/find_origin
