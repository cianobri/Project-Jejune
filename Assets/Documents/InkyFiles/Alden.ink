=== Alden
{ftt2Partner:Flavour text that can be used the first time, and after he hears you opening the hatch. Green text on a dark backgroung streams vertically on the display beside him.|"Well, what did you find? Can you access their vessel register? What about the COM log?"}
{GoForIt: "What was that racket?!"}

* {Register} [I got their register, its the {distressedVesselName} alright. Just a little lower than we expected.] 
~ftt2Partner = false
->ReadRegister
* {not Register} [I didn't take a look at the register, but the uplink seems to be working."] 
~ftt2Partner = false
-> DidntReadRegister
* {ComLog} [The COM log says they have issue with one of their L-struts. Caused a sudden altitude drop.] 
~ftt2Partner = false
-> ReadComLog
* {not ComLog} [COM log? Do I need to check it?] 
~ftt2Partner = false
-> DidntReadComLog
* {not ftt2Partner} [What are you expecting? Their systems are probably down{ReadRegister: due to the sudden altitude drop}. {ComUplink: I tried the uplink but the connection is bad.}] 
~ftt2Partner = false
-> WaitingForRescue
* {Messages} [You've an unread message at your terminal Alden. I think it's from your daughter.] 
~ftt2Partner = false
-> AldenDaughterMessage

* {GoForIt} [I managed to open the main hatch, we should be able to enter.] -> TellAldinMainHatchOpen

+ [Done.] -> Main


== ReadRegister
"How low we talkin'?"
+ {AbukumaLocation} [About 108 kilometers.] -> KnowAlt
+ {not AbukumaLocation} [I dont't know.] -> DontKnowAlt

== DidntReadRegister
"Go back to the terminal and take a look. {not ComLog: See if you can get a copy of the COM log while you're at it.}
+ [Done.] -> Main

== ReadComLog
"Well shit."
+ [Done] -> Main

== DidntReadComLog
He furrows his brow.

"Well, yeah. We need to see what we're dealing with before boarding..."
+ [Done.] -> Main

== KnowAlt
"Fucking hell! It was one 'k' higher yesterday! We might be walking into a complete fucking mess."
+ [Done.] -> Main

== DontKnowAlt
sdfds
+ [Done.] -> Main

== WaitingForRescue
"So they can't look be bothered to look out the window? They're waiting for rescue!"

He's getting animated now.
+ {ComLog} [Well their systems are definetely damaged, the COM log was utter gibberish.] -> Main
+ [Done.] -> Main

== AldenDaughterMessage
"And just how do you know that, young fella'?"
+ [Well you left it logged in...] -> Main

== TellAldinMainHatchOpen
"Brute force and ignorance wins the day, eh?"
* [I battered that bitch.] -> BatteredBitch
* [Yes, me and the hatch a "crowbar-versation".] -> CrowbarVersation

== BatteredBitch
He rolls his eyes, but you think you see concealed smirk.

"What a hero."
+ [Return.] -> Main

== CrowbarVersation
"Fucking HELL!"
+ [Return.] -> Main