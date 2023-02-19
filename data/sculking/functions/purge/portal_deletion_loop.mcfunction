data modify entity @s Pos set from storage sculking portals[0].origin

## remember for later whether this area was already forceloaded (by the player, other datapacks, etc)
execute at @s store result score @s sculking.error_check run forceload query ~ ~
execute at @s run forceload add ~ ~

#wreck the portal and its data
execute as @e[type=marker,tag=sculking.portal] at @s run function sculking:portal/destroy
data remove storage sculking portals[0]

## restore previous forceload setting
execute at @s if score @s sculking.error_check matches 0 run forceload remove ~ ~

tellraw @a [{"text":"","color":"yellow"},{"text":"Deleted portal at "},{"nbt": "Pos[]","entity": "@s","separator": " / "}]

## send home
data modify entity @s Pos set value [0d,0d,0d]

## NOTE: this time can be changed if the server is too slow!
schedule function sculking:purge/really_purge_all 5t
