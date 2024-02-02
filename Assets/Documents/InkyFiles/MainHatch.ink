=== MainHatch
{A large, significant hatch. It's well-worn and round-edged, with numerous scratches and grime tarnishing it surface. It frames a recessed handle, with the word "OPEN" emblazened accross it in large utilitarian letters. | Before you is a large hatch. You can see your reflection staring back through a dark, one-way porthole.}

{mainHatchLocked:To the left is an old intercom. To the right, a large complicated locking mechanism. In the middle, a recessed handle. |Now that the mechanim is released, you should be able to open the hatch.}

+ [Try the intercom.] -> MainDoorIntercom
+ [Examine the mechanism.] -> MainHatchMechanism
+ {mainHatchLocked} [Attempt to open the hatch.] -> TryOpenHatch
* {not mainHatchLocked} [Attempt to open the hatch.] -> TryOpenHatchUnlocked
+ [Return.] -> Main

== TryOpenHatch
The hatch is locked.
+ {hasCrowbar and mainHatchLocked} [Try to use the crowbar to open the hatch.] ->CrowbarHatch
+ [Return.] -> MainHatch

== TryOpenHatchUnlocked
The hatch opens with an ominous groan, as if the {distressedVesselName} is unhappy to see you.
~ mainHatchOpen = true
+ [Return] -> Main

== CrowbarHatch
This was never going to work. You give the hatch a few half-hearted taps with the crowbar. 
~bangedOnHatch = true
{ftt2Officer: The intercom flashes green and you hear a disembodied voice.}-> MainDoorIntercom
{not ftt2Officer:  "... can you stop that?"}
+ [Continue examining the hatch.] -> MainHatch