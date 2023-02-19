This file is largely notes to self, but may be useful for others who may be testing/modifying the code.

Testing suite consists of:

### PORTAL SPAWNING:

- Structure block that spawns in a fully-loaded frame minus the top lightning rod.
- A list of unusual ways to make a portal:
  - Underground
  - In a very tight space
  - Underwater\*
  - Missing blocks
  - Lightning rods facing the wrong way
  - Wrong type of walls
  - No items in barrel
  - Wrong type of items in barrel
  - Wrong quantities of items in barrel
  - Items in empty sections of barrel\*
  - Another portal too close
      
### DESTINATION SETTING:

- A list of unusual ways to set a portal:
  - Underwater\*
  - In tall grass\*
  - Two very close portals
  - Correct coordinates but incorrect dimension
  - Incorrect coordinates but correct dimension
  - Wrong ID
  - Setting the destination inside another portal ( :( why would you do this to me)
  - Setting the destination inside another unset destination
  - Setting the destination very close to another unset destination

### PORTAL DESTRUCTION:

- Structure block that spawns in a fully-loaded barrel and frame.
- Button that executes `sculking:portal/build_new_sculk` at the position of the top lightning rod (+0.5 to each coordinate).
- A list of unusual ways to break a portal:
  - Tool
  - Empty hand
  - Piston
  - TNT
  - Creative mode player pressing m1 & m2 at the same time to replace the block in the same tick
  - A really laggy player
  - Evil modded endermen?? (they can't usually pick any of these up...but you can never be too safe)
  - Evil modded sculk ( :/ )
      
### GRIEFER / GROSS NEGLIGENCE SIMULATOR:*
  - A wide pit covered in tinted glass (for maximum visibility w/ minimal light).
  - Hovering inside the pit is a minecraft:spawner{SpawnData: {entity: {id: "minecraft:creeper"}}, MinSpawnDelay: 60s, MaxSpawnDelay: 60s, RequiredPlayerRange: 64s, SpawnCount: 1s}
  - Below the spawner is a water funnel into a 1x15x1 deep pit
  - At the bottom of the deep pit is an end gateway.
  - This gateway leads to a distant, unloaded chunk of known location (so that the region may be deleted if necessary).
  - The pit is to be left alone but within range of a player. After an extended period of time, jump in the gateway to see if the number of creepers on the other side crashes the game.
    
\* = These tests are currently known to fail
