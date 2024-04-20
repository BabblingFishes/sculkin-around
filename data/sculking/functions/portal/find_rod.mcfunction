## This is a raycast from the player to the lightning rod they placed
## NOTE: Ensure score @s sculking.error_check is set to 0 BEFORE calling this function

## Are we out of range?
execute if score @s sculking.error_check matches 0..1 unless entity @s[distance=..7] run scoreboard players set @s sculking.error_check -1

## Have we found a new lightning rod?
execute if score @s sculking.error_check matches 0 if block ^ ^ ^ minecraft:lightning_rod run scoreboard players set @s sculking.error_check 2

## If we're currently in a lightning rod, have we found the exit?
execute if score @s sculking.error_check matches 1 unless block ^ ^ ^ minecraft:lightning_rod run scoreboard players set @s sculking.error_check 0

## Is there a valid frame?
execute if score @s sculking.error_check matches 2 align xyz positioned ~0.5 ~0.5 ~0.5 if predicate sculking:portal_blank run function sculking:portal/frame_check

## If we've found a new lightning rod but no frame, wait until we pass through this lightning rod to keep looking, so that we aren't checking the same damn thing every time
execute if score @s sculking.error_check matches 2 run scoreboard players set @s sculking.error_check 1

##DEBUG
#execute if score @s sculking.error_check matches 0 run particle minecraft:block_marker barrier ~ ~ ~ 0 0 0 0 1
#execute if score @s sculking.error_check matches 1 run particle minecraft:block_marker light ~ ~ ~ 0 0 0 0 1

## Loop
## NOTE: In case it wasn't obvious: always do this last!
execute if score @s sculking.error_check matches 0..1 positioned ^ ^ ^0.25 run function sculking:portal/find_rod
