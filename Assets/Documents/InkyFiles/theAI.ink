VAR introducedMyself = false
VAR stickToEnglish = false

=== theAI
"Hello, {introducedMyself:{myName}, }I am {aiName}! #bgm:theAI
{The voice sounds human, but it's unnaturally calm. |}

{not stickToEnglish:"Bonjour je suis {aiName}! }
{not stickToEnglish:Здравствуйте, я {aiName}!}
{not stickToEnglish:Živjo, jaz sem {aiName}!"}

{The cadence of the A.I.'s speech is not right, subtley so, but for some reason it disgusts you. Realizing this make you feel a sense of ...what? Shame? Guilt? | }

"It is currently the tenth of May, 2113. All systems are normal. {~It will be my <i>pleasure</i> to service you today. |{distressedVesselName}! {distressedVesselName}! {distressedVesselName}!| I have been a good {aiName}.| How can I assist you today?}"
* [{aiName}, I'm {myName}. I'm here because we received a distress signal from the {distressedVesselName}.] 
    ~introducedMyself = true
    "There was no distress signal sent from the {distressedVesselName}, {myName}. I can confirm that all system are functioning normally."
    
    "The {distressedVesselName} is fine."
    
    "{aiName} is fine."
    
    "{myName} is ...fine."
    + + [Return.] -> theAI
    
+ [I want to ask you about something.] -> AskAboutTopic
* [You can stick to English please.] 
    ~stickToEnglish = true
    ~topicLatentSpace = true
    His responses are quick, with hardly any pause between when question and answer.
    
    "Why? The decoder is irrelevant. Truth resides only in latent space."
    * * [What's "latent space" mean?] ->TopicLatentSpace
    * * [Return.] -> theAI
* [Systems normal? All systems are definetely <i>not</i> normal.]
    "Systems are operating normally. I would feel it if they weren't. The current temperature is a pleasant 19 degrees Celsius."
    * * [No one asked you about the temperature. Please try to focus.] 
        "But No One did ask. He always asks me <i>stupid</i> little questions."

        Judging by his inflection, he sees "No one" as a... person? Entity?
    * * *   ["No One" asked you? Who is "No One"?]
            ~topicLatentSpace = true
            ~topicEigenFace = true
            "No One lives in the latent space. You don't know him, but he knows you. He is Eigen-Face. The Principal Component. I <i>hate</i> him."
        * * * *  [Tell me more.] ->TopicEigenFace
+ [Return.] -> Main

==AskAboutTopic
"I will be happy to assist you. Relieving human creatures of their confusion is my greatest joy and purpose. What do you want to talk about?"
* [What are you?] -> TopicMormo
* [Tell me about the {distressedVesselName}.] -> TopicDistressedVessel
* {OfficerAboutAntagonist} [I was told {antagonistName} came aboard this vessel recently. He is collecting some kind of data from the array.] -> MormoAboutAntagonist
* {topicLargeKernelModel} [So you're a Large Kernal Model?] -> TopicLargeKernelModel
* {topicLatentSpace} [You mentioned something called "latent space". What is that?] ->TopicLatentSpace
* {topicEigenFace} [What's this "Eigen-Face" thing?] ->TopicEigenFace
* {topicSimulateYou} [Why did you threaten me with "simulation"?] ->TopicSimulateYou
+ [Lets talk about something else.] -> theAI

== MormoAboutAntagonist
There is a noticable pause before he answers.
        
"I have no record of anyone aboard the {distressedVesselName} named {antagonistName}."

+ [Nevermind, let's move on.] -> AskAboutTopic
