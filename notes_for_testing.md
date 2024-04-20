This file is largely notes to self, but may be useful for others who may be testing/modifying the code.

Testing suite consists of the following:

## PORTAL-MAKING

Note that you will probably want, at minimum:
- Structure block that spawns in a fully-loaded frame.
- Command block button for `execute positioned <X>.5 <Y>.5 <Z>.5 run function sculking:portal/build_new_sculk` where X Y Z are the coordinates of the top lightning rod.

### Frame Building:

- A list of unusual ways to build a frame:
  - Underground
  - In a very tight space
  - Underwater\*
  - Missing blocks
  - Lightning rods facing the wrong way
  - Wrong type of walls
  - No items in barrel
  - Missing items in barrel
  - Wrong items in barrel
  - Wrong quantities of items in barrel
  - Items in empty sections of barrel\*
  - Another portal too close
      
### Destination Setting:

- A list of unusual ways to place/activate a warp spore:
  - Underwater\*
  - In tall grass\*
  - On a fence or wall post
  - In an invalid dimension
  - Inside another unset destination
  - Really close to another unset destination
  - After the matching frame has been destroyed
  - After destroying & rebuilding a new frame in the exact same spot.
  - With a second portal frame as close as possible to this one's
  - In such a way to bypass a wall (for example to clip through the nether roof)

### Frame Destruction:

- A list of unusual ways to break a portal:
  - Tool
  - Empty hand
  - Piston
  - TNT
  - Creative mode player pressing m1 & m2 at the same time to replace the block in the same tick
  - A really laggy player
  - Evil modded endermen?? (they can't usually pick any of these up...but you can never be too safe)
  - Evil modded sculk spreading? ( :/ )
      
## GRIEFER / GROSS NEGLIGENCE SIMULATOR:\*

- Mob grinder but with a portal at the bottom
  - Note that the portal gives off light. It needs to be at least 15 away from the spawning area
  - In case you forget how to do this:
    - Build a wide room out of tinted glass (for maximum visibility w/ minimal light).
    - Hovering inside the pit is a minecraft:spawner{SpawnData: {entity: {id: "minecraft:creeper"}}, MinSpawnDelay: 60s, MaxSpawnDelay: 60s, RequiredPlayerRange: 64s, SpawnCount: 1s}
    - Below the spawner is a water funnel into a 1x15x1 deep pit
    - At the bottom of the deep pit is an end gateway.
    - This gateway leads to a distant, unloaded chunk of known location (so that the region may be deleted if necessary).
    - The pit is to be left alone but within range of a player. After an extended period of time, jump in the gateway to see if the number of creepers on the other side crashes the game.
    
\* = These tests are currently known to fail
