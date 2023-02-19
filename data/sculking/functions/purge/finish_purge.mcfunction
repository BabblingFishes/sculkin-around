# purge loose destination shriekers and markers
execute at @e[tag=sculking.destination] run setblock ~ ~ ~ minecraft:air
kill @e[tag=sculking.destination]
kill @e[type=marker,tag=sculking.dim_id_ref]

# purge data
scoreboard players reset sculking.world
data remove storage sculking portals

tellraw @a [{"text":"Sculkin' purge complete.","color":"yellow"}]

## NOTE: What this will not purge:
## - Forceloads at 0,0 of each dimension (Other datapacks frequently use these and I have no way to keep track)
## - Items like Warp Spores (I can't go hunting down every chest in your world)
## - Scoreboard objectives (Easy to remove manually + would break things if you kept using the datapack without reloading)
