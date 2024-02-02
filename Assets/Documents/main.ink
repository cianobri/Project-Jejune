INCLUDE InkyFiles/introduction.ink
INCLUDE InkyFiles/Alden.ink
INCLUDE InkyFiles/Vars.ink
INCLUDE InkyFiles/AldensTerminal.ink
INCLUDE InkyFiles/theAI.ink
INCLUDE InkyFiles/Dove.ink
INCLUDE InkyFiles/MainDoorIntercom.ink
INCLUDE InkyFiles/MainHatch.ink
INCLUDE InkyFiles/MainHatchMechanism.ink
INCLUDE InkyFiles/JejuneEquipmentLocker.ink
INCLUDE InkyFiles/Functions.ink

-> Main

=== Main ===
Main
// ACT 1.
+ [Introduction] -> Introduction
+ [Alden] -> Alden
+ [AldensTerminal] -> AldensTerminal
+ [JejuneEquipmentLocker] -> JejuneEquipmentLocker

+ [MainHatch] -> MainHatch
+ [Dove] -> Dove
+ [AI] -> theAI

+ [Cube] -> Cube
+ [Sphere] -> Sphere

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
