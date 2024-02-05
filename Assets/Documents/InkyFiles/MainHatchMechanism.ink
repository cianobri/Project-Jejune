=== MainHatchMechanism
You examine the complicated mechanism. Above it is a sign reading "MANUAL RELEASE". There is a large lever in the centre with a sculpted grip, currently set in the {not mainHatchLocked: "OPEN"|"CLOSED"} position.
+ [Try to operate the mechanism{TryMechanism: again}{hasCrowbar: using the crowbar}.] -> TryMechanism
+ [Return.] -> Main

== TryMechanism
{not mainHatchLocked: The mechanism has already been released. -> MainHatch}
{not hasCrowbar: You struggle with the large mechanism, pulling, prying and twisting. The skin on your fingers turns white with stress and your joints complain.}

{not hasCrowbar: There is no way of releasing the lock by hand{not ftt2Partner:, even with {partner}'s help}.}

{hasCrowbar: You insert the crowbar and pull, exploiting the leverage afforded. The mechanism is unyielding.}
+ {hasCrowbar} [Pull harder.] -> PullHarder
+ [Give up.] -> MainHatch

== PullHarder
{~ Hnnnnng! | BUH! | HeUrFf! | Psssshhuuuee!} #sfx.mechanismGroan1
+ [HARDER.] -> HARDER
+ [Give up.] {~No giving up now! | You're commited now, keep trying! | No! Almost there! } -> PullHarder
== HARDER
...gyyaAAAH!!!#sfx.mechanismGroan2
+ [Put all your body weight behind it. Really go for it.] -> GoForIt

== GoForIt
~mainHatchLocked = false
With a loud scraping sound, the mechanism releases. As it snaps into place, it sets off a chain reaction of gears and servos. #sfx.mechanismRelease

The tension released, the main hatch visibly slumps. You should be able to open it now.
+ [Examine the hatch.] -> MainHatch

== UsedTool
The {pickedUpTool} was no match for 500 kilograms of reenforced steel.
+ [Was worth a try...] -> MainHatchMechanism