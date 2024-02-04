=== Officer
{The intercom voice belongs to a small man, with a slightly nervous disposition. As you approach, his eyes dart from you, to the open hatch, and back. He awkwardly raises his hand in the beginning of a wave, but thinks better of it.| His dejected gaze meets yours.}
* [Forced the mechanism with a crowbar, bit of a struggle but I'm here now.] -> HereNow

== HereNow
"Yes, ...ah... good. Well done."
* [So tell me, what's your situation?] -> WhatsSituation
* {WhatsAI} [You mentioned something is up with your A.I. system?] -> SomethingUpWithAi

== WhatsSituation
"Where do you want to start? We're having several issues, the most important being our uncontrolled altitude drops. It's stabilized for now but I don't know what's causing it."
* [Who else is on board?] -> WhoElseOnBoard
* [You must have some idea what's causing it?] -> SomeIdeaOfCause
+ [Return.] -> Main

== WhoElseOnBoard
"It's just the three of us. {aiName}'s our LKM A.I., he's the one repsonsible for the overall operation. Then there's Dr. {antagonistName}; he's the Chief Scientist carrying out the experiment stuff on the lower-deck."
* [And where is this Dr. {antagonistName} now?] ->AboutAntagonist

== SomethingUpWithAi
sdf
+ [Return.] -> Main

== SomeIdeaOfCause
"Why would I? I'm just maintenance crew. I know enough to upkeep the non-essential systems but most of our operation is controlled by {aiName}.
* {WhatsAI} [{aiName}, that's your A.I. right?] -> AboutAI
* [Where's the rest of the crew?] -> WhoElseOnBoard
+ [Return.] -> Main

== AboutAntagonist
"I think he's still in the... the lower-deck. When things started malfunctioning he ran off to see to his experiments, said they conducting 'sensitive' research. I haven't heard from him in a few hours, bloody com system is acting up. Only managed to talk to you because the intercom is wired directly to the air-lock."
* [And what about your A.I.?] -> Main

== AboutAI
"{aiName} keeps the show on the road. We used be a twelve-man crew but they automated almost everything by having {aiName} do it. Problem is, he's turned into, well... ah... a fucking idiot. It's like he's had a lobotomy."
+ [Return.] -> Main
