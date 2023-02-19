setblock ~ ~ ~ minecraft:air destroy
kill @e[type=minecraft:item,distance=..1,limit=1,nbt={Item:{id:"minecraft:sculk_shrieker"}}]
kill @e[type=minecraft:experience_orb,distance=..1]
loot spawn ~ ~ ~ loot sculking:warp_spore
data modify entity @e[type=minecraft:item,distance=..1,limit=1,nbt={Item:{id:"minecraft:warden_spawn_egg"}}] Age set value -32768s
kill @s
