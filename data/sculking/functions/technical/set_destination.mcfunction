particle minecraft:scrape ~ ~0.2 ~ 0 0 0 1 20

## TODO VERIFY DIMENSION ID and RETURN EGG IF BAD

## Store our current position
data modify entity @s data.destination set from entity @s Pos

## Then scoot back home so we can load it
data modify entity @s Pos set from entity @s data.sculking.origin
execute at @s run function sculking:technical/set_destination_2

## TODO check that the nearest entity is still the executing player...
tellraw @p [{"text":"Destination set to: "},{"nbt": "data.destination[]","entity": "@s","separator": " / "}, {"text":"\nFor portal located at: "},{"nbt": "data.sculking.origin[]","entity": "@s","separator": " / "}]