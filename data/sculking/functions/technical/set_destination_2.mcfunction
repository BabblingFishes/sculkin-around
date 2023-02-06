forceload add ~ ~

execute store result block ~ ~-2 ~ ExitPortal.X int 1 run data get entity @s data.destination[0]
execute store result block ~ ~-2 ~ ExitPortal.Y int 1 run data get entity @s data.destination[1]
execute store result block ~ ~-2 ~ ExitPortal.Z int 1 run data get entity @s data.destination[2]

## TODO set wall blocks (fix tick before attempting this or it will explode the portal)

#tellraw @p [{"text":"Destination set to: "},{"nbt": "data.destination[]","entity": "@s","separator": " / "}, {"text":"\nFor portal located at: "},{"nbt": "data.sculking.origin[]","entity": "@s","separator": " / "}]

## Cleanup
forceload remove ~ ~
kill @s