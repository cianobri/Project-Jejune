=== MainDoorIntercom
{not bangedOnHatch:You touch the intercom{~ and it beeps in acknowledgement| and it hisses to life}.}

{not bangedOnHatch:{~Moments later,|After a beat,} a voice fills the air-lock.}

{not ftt2Officer: "{~What is it? |Everything OK? }{not mainHatchLocked: {~Hurry up and get in here. | ...oh, you got the hatch open. Come on in.}| {~I can't open the hatch from the inside, you'll have to figure something out| You're on your own until you get that hatch open}. {hasCrowbar and mainHatchLocked: Have you found anything to get that door open?}}"}
{ftt2Officer:"Who's there... uh... this, this is Officer {officerName}. You're the... from the... the {myVesselName}? We we're hoping you guys would hear us."}

* {mainHatchLocked}  [{ftt2Officer:Yes, I'm Dr. {myName}, {myPosition} aboard the NATO {myVesselName}. We're responding to a MAYDAY request.} What's your situation? Can you open the hatch?] 
~ ftt2Officer=false
-> OpenHatch
* {not mainHatchLocked} [{ftt2Officer:Yes, I'm Dr. {myName}, {myPosition} aboard the NATO {myVesselName}. I've opened that hatch and }I'm coming aboard.] 
~ ftt2Officer=false
-> ComingAboard
* {hasCrowbar and not ftt2Officer and mainHatchLocked} [I've got a crowbar.] 
-> IHaveCrowbar
+ {mainHatchLocked and OpenHatch} [Can you tell what's going on in there?] 
~ ftt2Officer=false
-> WhatsGoingOn
+ {not ftt2Officer} [Return.] -> Main

== OpenHatch
The intercom splutters intermittently; he's fumbling with the controls.

"... I uh... we're having some problems here... you might have guessed from the... the distress signal."

+ [...so can you open it?] -> CanYouOpenIt

== CanYouOpenIt
"To be honest, no I can't. There's somethign wrong with {aiName}, we we're hoping you could help us with that."

+ ["{aiName}"? What's a "{aiName}"?] -> WhatsAI

== WhatsAI
"Oh, sorry. {aiName} is our Large Kernel Model - our central control A.I. He's not really... taking orders right now. You'll have to open the hatch manually from your side."

"There should be a mechanism to the right of the door, see if you can get the hatch open."

* {TryMechanism} [Yeah, I tried it already. It's too heavy to open by hand{not ftt2Partner:, even for the two of us}.] -> TriedOpenAlready
+ {not TryMechanism}[Alright, I'll take a look. ] -> MainHatch

== WhatsGoingOn
"Everything's a mess. Our struts are damaged, we won't be able to maintain our altitude for much longer. {aiName} isn't helping.

{& I'll fill you in once you get the hatch open." | Lets's talk in person. Get the hatch open." | Please hurry!}
* [Who else is in there?] -> WhoElseInThere
+ [Return.] -> Main

== SawYourAltDropping
"Yeah"
+ [d] -> Main

== TriedOpenAlready
"Okay, it must have been damaged when our altitude suddenly dropped. Can you, uh, find something to pry it open with?"
+ [Maybe, let me look.] -> MainHatch

== ComingAboard
"Oh, you got the hatch open. Roger that."
+ [Return.] -> Main

== WhoElseInThere
blah 
+ [Return.] -> Main

== IHaveCrowbar
"Hmm, yeah.... Yeah that might do it. You'll need to try and force the mechanism, then you can open the hatch."
+ [I'll give it a try.] -> MainHatchMechanism