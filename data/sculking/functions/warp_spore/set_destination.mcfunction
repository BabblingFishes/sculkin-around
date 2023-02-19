execute store result score @s sculking.error_check run forceload query ~ ~

forceload add ~ ~

playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 4 0.75
particle minecraft:explosion ~ ~-2 ~ 0 0 0 1 1
particle minecraft:sonic_boom ~ ~-2 ~
particle minecraft:scrape ~ ~-2 ~ 1 2 1 10 20

execute store result block ~ ~-2 ~ ExitPortal.X int 1 run data get entity @s data.destination[0]
execute store result block ~ ~-2 ~ ExitPortal.Y int 1 run data get entity @s data.destination[1]
execute store result block ~ ~-2 ~ ExitPortal.Z int 1 run data get entity @s data.destination[2]

setblock ~ ~-1 ~ minecraft:prismarine_wall
setblock ~ ~-3 ~ minecraft:prismarine_wall

tellraw @a[tag=sculking.stepper] [{"text":"","color":"dark_aqua"},{"text":"The portal has heard your call!\n","color":"aqua"},{"text":"Destination set to: "},{"nbt": "data.destination[]","entity": "@s","separator": " / "}, {"text":"\nFor portal located at: "},{"nbt": "data.sculking.origin[]","entity": "@s","separator": " / "}]

## Cleanup
execute if score @s sculking.error_check matches 0 run forceload remove ~ ~
