advancement revoke BabblingFishes only sculking:technical/place_rod

#say DEBUG: Checking for portal...

scoreboard players set @s sculking.error_check 0
execute at @s anchored eyes positioned ^ ^ ^ run function sculking:portal/find_rod
scoreboard players reset @s sculking.error_check

#say DEBUG: ...portal check complete.
