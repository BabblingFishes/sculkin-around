# TODO Forceload other portals to kill them? Maybe keep the list in storage?
# to do this in a chill fashion:
# while there is data in storage
# forceload coords
# delete portal (REMEMBER TO REMOVE DATA FROM STORAGE ON DELETION)
# do it again in 20 ticks

execute as @e[tag=sculking.portal] at @s run function sculking:technical/destroy_portal
kill @e[tag=sculking.dim_id_ref]
scoreboard players reset sculking.world