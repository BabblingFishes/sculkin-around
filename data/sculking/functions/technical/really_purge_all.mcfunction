# TODO Forceload other portals to kill them? Maybe keep the list in storage?
# to do this in a chill fashion:
# while there is data in storage
# forceload coords
# delete portal (REMEMBER TO REMOVE DATA FROM STORAGE ON DELETION)
# do it again in 20 ticks

## While there is data in storage, delete the first portal
execute store success score sculking.world sculking.error_check run data get storage sculking portals[0]
# (we're also purging sculking.world, so I have no problem nuking this value)
execute if score sculking.world sculking.error_check matches 1 store result score sculking.world sculking.dim_id run data get storage sculking portals[0].dim_id
execute if score sculking.world sculking.error_check matches 1 as @e[type=marker,tag=sculking.dim_id_ref] if score @s sculking.dim_id = sculking.world sculking.dim_id run function sculking:technical/portal_deletion_loop

## Loop complete -- purge data, dimension markers
data remove storage sculking portals
execute if score sculking.world sculking.error_check matches 0 run kill @e[type=marker,tag=sculking.dim_id_ref]
execute if score sculking.world sculking.error_check matches 0 run tellraw @a [{"text":"Sculkin' purge complete.","color":"yellow"}]
execute if score sculking.world sculking.error_check matches 0 run scoreboard players reset sculking.world
