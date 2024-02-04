VAR tTool = "none"
=== JejuneEquipmentLocker
electrons 
+ {not hasCrowbar} [Pickup the crowbar.] -> PickupCrowbar
+ {pickedUpTool != "scissors"} [Pickup the scissors.] -> PickupScissors
+ {pickedUpTool != "masking tape"}[Pickup the masking tape.] -> PickupMaskingTape
+ [Return.] -> Main

== PickupCrowbar
~hasCrowbar = true
You pick up the crowbar, giving a couple of test swings to feel its weight.
+ [Return.] -> Main

== PickupScissors
{pickedUpTool != "none": You replace the {pickedUpTool} and |You }pick up the scissors. 
~pickedUpTool = "scissors"
+ [Return.] -> Main

== PickupMaskingTape
{pickedUpTool != "none": You replace the {pickedUpTool} and |You }pick up the masking tape.
+ [Return.] -> Main

== ReplaceTool
You put the {pickedUpTool} back. Another time old friend.
~pickedUpTool = "none"
+ [Return.] -> JejuneEquipmentLocker


+ [Return.] -> Main
