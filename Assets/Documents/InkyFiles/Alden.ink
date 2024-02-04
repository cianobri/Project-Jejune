=== Alden
{ftt2Partner:Flavour text that can be used the first time, and after he hears you opening the hatch. Green text on a dark backgroung streams vertically on the display beside him.|"Well, what did you find? Can you access their vessel register? What about the COM log?"}
{GoForIt: "What was that racket?!"}

* {GoForIt} [I managed to open the main hatch, we should be able to enter.] -> TellAldinMainHatchOpen
~ftt2Partner = false
+ [Done.] -> Main


== TellAldinMainHatchOpen
"Brute force and ignorance wins the day, eh?"
* [I battered that bitch.] -> BatteredBitch
* [Yes, me and the hatch a "crowbar-versation".] -> CrowbarVersation

== BatteredBitch
He rolls his eyes, but you think you see concealed smirk.

"What a hero."
+ [Return.] -> Main

== CrowbarVersation
"You crowbarse-hole."
+ [Return.] -> Main