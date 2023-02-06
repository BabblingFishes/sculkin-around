#particle minecraft:scrape ~ ~-2 ~ 0.2 1 0.2 10 500 normal

fill ~ ~ ~ ~ ~-4 ~ minecraft:stone_brick_wall replace #sculking:portal_frame
fill ~ ~ ~ ~ ~-4 ~ minecraft:air


particle minecraft:dragon_breath ~ ~-2 ~ 0.25 1 0.25 0.1 100
particle minecraft:sonic_boom ~ ~-2 ~
playsound minecraft:item.trident.thunder block @a ~ ~ ~ 4 1

##TODO REMOVE WALL ON GROUND

kill @s