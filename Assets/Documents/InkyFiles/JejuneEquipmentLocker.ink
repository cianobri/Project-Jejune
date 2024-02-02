=== JejuneEquipmentLocker
electrons #sfx.testDoorUnlock
+ [Pickup the crowbar.] -> PickupCrowbar
+ [Pickup the scissors.] -> PickupScissors
+ [Pickup the masking tape.] -> PickupMaskingTape
+ [Return.] -> Main

== PickupCrowbar
~hasCrowbar = true
You pick up the crowbar, giving a couple of test swings to feel its weight.
+ [Return.] -> Main

== PickupScissors
~pickedUpTool = "scissors"
{hasCrowbar: You replace the crowbar and |You }pick up the scissors. 
~hasCrowbar = false
+ [Return.] -> Main

== PickupMaskingTape
~pickedUpTool = "masking tape"
{hasCrowbar: You replace the crowbar and |You }pick up the masking tape.
~hasCrowbar = false
+ [Return.] -> Main

== ReplaceTool
You put the {pickedUpTool} back. Another time old friend.
~pickedUpTool = "none"
+ [Return.] -> JejuneEquipmentLocker
~pickedUpTool = "masking tape"
{hasCrowbar: You replace the crowbar and |You }pick up the masking tape.
~hasCrowbar = false
+ [Return.] -> Main
