## Summary:
# while there is data in storage
# forceload coords
# delete portal
# remove these coords from storage
# do it again in 5 ticks

# (we're also purging sculking.world, so I have no problem nuking this value)

## Check if there are coords in storage
execute store success score sculking.world sculking.error_check run data get storage sculking portals[0]

## If no, loop complete -- purge data, incomplete destination markers, dimension markers
execute if score sculking.world sculking.error_check matches 0 run function sculking:purge/finish_purge

## If yes, send the dim_ref to kill the portal there and loop
execute if score sculking.world sculking.error_check matches 1 store result score sculking.world sculking.dim_id run data get storage sculking portals[0].dim_id
execute if score sculking.world sculking.error_check matches 1 as @e[type=marker,tag=sculking.dim_id_ref] if score @s sculking.dim_id = sculking.world sculking.dim_id run function sculking:purge/portal_deletion_loop
