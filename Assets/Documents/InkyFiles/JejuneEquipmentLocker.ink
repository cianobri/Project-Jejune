VAR tTool = "none"
=== JejuneEquipmentLocker
An old, greasy equipment locker.
+ {not hasCrowbar} [Pickup the crowbar.] -> PickupCrowbar
+ {pickedUpTool != "scissors"} [Pickup the scissors.] -> PickupScissors
+ {pickedUpTool != "masking tape"}[Pickup the masking tape.] -> PickupMaskingTape
+ [Return.] -> Main

== PickupCrowbar
~hasCrowbar = true
You pick up the crowbar, giving a couple of test swings to feel its weight. #sfx.toolbox
+ [Return.] -> Main

== PickupScissors
{pickedUpTool != "none": You replace the {pickedUpTool} and |You }pick up the scissors. #sfx.toolbox
~pickedUpTool = "scissors"
+ [Return.] -> Main

== PickupMaskingTape
{pickedUpTool != "none": You replace the {pickedUpTool} and |You }pick up the masking tape. #sfx.toolbox
+ [Return.] -> Main

== ReplaceTool
You put the {pickedUpTool} back. Another time old friend. #sfx.toolbox
~pickedUpTool = "none"
+ [Return.] -> JejuneEquipmentLocker


+ [Return.] -> Main
