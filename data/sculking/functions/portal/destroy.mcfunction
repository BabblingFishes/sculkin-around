fill ~ ~ ~ ~ ~-4 ~ minecraft:air

particle minecraft:dragon_breath ~ ~-2 ~ 0.25 1 0.25 0.1 100
particle minecraft:sonic_boom ~ ~-2 ~
playsound minecraft:item.trident.thunder block @a ~ ~ ~ 4 1

## Remove any drops the player has generated from the walls
execute positioned ~ ~-1 ~ run kill @e[type=minecraft:item,distance=..0.5]
execute positioned ~ ~-3 ~ run kill @e[type=minecraft:item,distance=..0.5]

kill @s
