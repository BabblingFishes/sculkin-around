advancement revoke @s only sculking:technical/step_n_shriek
execute as @e[type=marker,tag=sculking.destination,distance=..1,sort=nearest,limit=1] run function sculking:warp_spore/find_origin
