forceload add ~ ~

execute store result block ~ ~-2 ~ ExitPortal.X int 1 run data get entity @s data.destination[0]
execute store result block ~ ~-2 ~ ExitPortal.Y int 1 run data get entity @s data.destination[1]
execute store result block ~ ~-2 ~ ExitPortal.Z int 1 run data get entity @s data.destination[2]

setblock ~ ~-1 ~ minecraft:prismarine_wall
setblock ~ ~-3 ~ minecraft:prismarine_wall

tellraw @a[tag=sculking.key_activator] [{"text":"Destination set to: ","color":"aqua"},{"nbt": "data.destination[]","entity": "@s","separator": " / "}, {"text":"\nFor portal located at: "},{"nbt": "data.sculking.origin[]","entity": "@s","separator": " / "}]

## Cleanup
forceload remove ~ ~
