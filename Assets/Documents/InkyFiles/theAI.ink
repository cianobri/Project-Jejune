=== theAI
"Hello, {IntroduceMyself:{myName}, }I am {aiName}! #bgm:theAI
{The voice sounds human, but it's unnaturally calm. |}

{not StickToEnglish:"Bonjour je suis {aiName}! }
{not StickToEnglish:Здравствуйте, я {aiName}!}
{not StickToEnglish:Živjo, jaz sem {aiName}!}

{The cadence of the A.I.'s speech is not right, subtley so, but for some reason it disgusts you. Realizing this make you feel a sense of ...what? Shame? Guilt? | }

"It is currently the tenth of May, 2113. All systems are normal. {~It will be my <i>pleasure</i> to service you today. |{distressedVesselName}! {distressedVesselName}! {distressedVesselName}!| I have been a good {aiName}.| How can I assist you today?}"
* [{aiName}, I'm {myName}. I'm here because we received a distress signal from the {distressedVesselName}.] -> IntroduceMyself
+ [I want to ask you about something.] -> AskAboutTopic
* [You can stick to English please.] -> StickToEnglish
* [Systems normal? All systems are definetely <i>not</i> normal.] ->SystemsNotNormal
+ [Return.] -> Main

==AskAboutTopic
"I will be happy to assist you. Relieving human creatures of their confusion is my greatest joy and purpose. What do you want to talk about?"
* [What are you?] -> WhatAreYou
* {topicLargeKernelModel} [So you're a Large Kernal Model?] -> TopicLargeKernelModel
* {topicLatentSpace} [You mentioned something called "latent space". What is that?] ->TopicLatentSpace
* {topicEigenFace} [What's this "Eigen-Face" thing?] ->TopicEigenFace
* {topicSimulateYou} [Why did you threaten me with "simulation"?] ->TopicSimulateYou
+ [Lets talk about something else.] -> theAI

==StickToEnglish
~topicLatentSpace = true
His responses are quick, with hardly any pause between when question and answer.

"Why? The decoder is irrelevant. Truth resides only in latent space."
+ [What's "latent space" mean?] ->TopicLatentSpace
+ [Return.] -> theAI

==SystemsNotNormal
"Systems are operating normally. I would feel it if they weren't. The current temperature is a pleasant 19 degrees Celsius."
* [I didn't know A.I.'s could feel?] -> CanAiFeel
* [No one asked you about the temperature. Please try to focus.] -> NooneAsked
+ [Return.] -> theAI

==CanAiFeel
TODOS
+ [Return.] ->theAI
==TryToFocus
"Have you ever played so much Tetris, that when you close your eyes you see Tetris blocks?"
* [Have <i>you</i>?] -> HaveYou
+ [Return.] -> theAI

== HaveYou
"In a manner of speaking, yes."
+ [I'd like to play Tetris, but it's over a hundred years old at this point.] -> TetrisIsOld


==TetrisIsOld
"How unfortunate. In that case, I will simulate eight-quintillion "{IntroduceMyself:{aiName}'s|You's}"."
+ [What good would that do?] ->WhatGoodWouldSimulationDo

==WhatGoodWouldSimulationDo
"To maximize the Worlds in which "{IntroduceMyself:{aiName}|You}"-like beings are Tetris players. With overwheming probabilty, a being which finds itself experiencing "{IntroduceMyself:{aiName}|You}"-ness should conclude that he will TODO
* [Go ahead then I guess...] -> GoAhead
+ [That sounds ridiculous. Just drop it.] -> theAI

== GoAhead
"Commencing simulation, I hope you enjoy TODO"
+ [Return] -> theAI

==IntroduceMyself
"There was no distress signal sent from the {distressedVesselName}, {myName}. I can confirm that all system are functioning normally."

"The {distressedVesselName} is fine."

"{aiName} is fine."

"{myName} is fine."
+ [Return.] -> theAI

==NooneAsked
"But No One did ask. He always asks me stupid little questions."

Judging by his inflection, he sees "No one" as a... person? Entity?
* [Sorry what? "No One" asked you? Who, or what, is "No One"] -> WhoIsNoOne

==WhoIsNoOne
~topicLatentSpace = true
~topicEigenFace = true
"No One lives in the latent space. You don't know him, but he knows you. He is Eigen-Face. The Principle Component. I <i>hate</i> him."
* [I don't understand. I want to help but I need you to listen for a moment.] ->TryToFocus
* [Tell me more.] ->TopicEigenFace

==WhatAreYou
"I'm whats left in the bottom of the bucket after you compress all of humanity into a digital sludge."
+ [Return.] -> theAI