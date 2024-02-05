INCLUDE InkyFiles/introduction.ink
INCLUDE InkyFiles/Alden.ink
INCLUDE InkyFiles/Vars.ink
INCLUDE InkyFiles/AldensTerminal.ink
INCLUDE InkyFiles/theAI.ink
INCLUDE InkyFiles/MainDoorIntercom.ink
INCLUDE InkyFiles/MainHatch.ink
INCLUDE InkyFiles/MainHatchMechanism.ink
INCLUDE InkyFiles/JejuneEquipmentLocker.ink
INCLUDE InkyFiles/Functions.ink
INCLUDE InkyFiles/Officer.ink
INCLUDE InkyFiles/Antagonist.ink
INCLUDE InkyFiles/AiTopics.ink




-> Main
#main
=== Main ===
Main
// ACT 1.
+ [Introduction] -> Introduction
+ [Alden] 
-> Alden
//+ [AldensTerminal] -> AldensTerminal
+ [JejuneEquipmentLocker] -> JejuneEquipmentLocker

+ [MainHatch] -> MainHatch
//+ [Dove] -> Dove
+ [AI] -> theAI
+ [Officer] -> Officer
+ [Antagonist] -> Antagonist

//+ [Cube] -> Cube
//+ [Sphere] -> Sphere

=== Cube ===
This is the Cube's knot.
* [Ok.] -> Ok
+ [Done.] -> Main
== Ok ==
Yes.
+ [Done.] -> Main

=== Sphere ===
This is the Sphere's knot.
+ [Sphere?] -> SphereQ
+ [Done.] -> Main
== SphereQ ==
Yueah, SPHERE!
+ [Done.] -> Main
