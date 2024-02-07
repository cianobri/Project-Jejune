VAR officerToldAboutMormo = false
VAR officerToldAboutAtmosphereDr = false
VAR officerToldAboutAntagonist = false
VAR officerToldAboutLeviAndIvanka = false
VAR officerToldAboutOthers = false

=== Officer
{The intercom voice belongs to a small man, with a slightly nervous disposition. He awkwardly raises his hand in the beginning of a wave, but thinks better of it.|His sorry gaze meets yours.}
* [Forced the mechanism with a crowbar, bit of a struggle but I'm here now.]
    "Yes, ...ah... good. Well done."
    * * [Now tell me, what's your situation?] 
        "Where do you want to start? The most important problem is our uncontrolled altitude drops. It's stabilized for now but..."
    -> OfficerMain

== OfficerMain
{|"What {Officer:else} can I do for you?"}
    
+ {theAI} [Tell me about {aiName}.] -> AboutAI
* [Where is everyone?]
    "It's just me on the air-locks deck. The rest of the crew were in the lower sections last I saw, but the last fall we had was pretty sever. Thats why I couldn't open the hatch manually from this side, the {distressedVesselName} suffered a lot of damage. I hope they're alright down there..."
    * * [Who else is on-board?]
        ~officerToldAboutAtmosphereDr = true
        "There was 8 of us, but Levi and Ivanka...
        * * * [What about them?] -> AboutLeviAndIvanka
+ [Tell me about the {distressedVesselName}.]
    "The {distressedVesselName}'s a High Altitude Platform, you know, a research vessel. We're up high enough for all sorts of observation work and to run experiments on the atmosphere that you just can't do at ground level."
    * * [Who's in charge?]
    ~officerToldAboutAntagonist = true
    "In charge? I guess {antagonistName} is technically in charge."
        * * * [What do you mean by "technically"?]
            "We're a research platform, not a military vessel. There's no strict hierarchy here. Most of us are scientists, working on atmospheric experiments or keeping an eye on that array."
            * * * * [I didn't realize you were communisits. So {antagonistName} is in charge <i>practically speaking</i>?]
                ~officerToldAboutAtmosphereDr = true
                "{antagonistName}'s the most senior Scientist. He came on board a few weeks ago, him and another two. Command had us completely change our plan; that set the Dr. {atmosphereDrName}'s experiments back months. He was <i>pissed</i>."
                
                He frowns.
                
                "... and it's not a Commune."
                    * * * * * [Tell me more about this {antagonistName}.] -> OfficerAboutAntagonist
                    * * * * * [Who is {atmosphereDrName}.] -> OfficerAboutAtmosphereDr
                    * * * * * [Who else arrived with {antagonistName}?] -> OfficerAboutOtherArrivals
                * * * * * [Tell me about Dr. {atmosphereDrName}.] -> OfficerAboutAtmosphereDr
            * * * * [About the research you're conducting...] ->OfficerAboutExperiments
    + + [I want to know about the crew.] -> AboutTheCrew
    + + [What research are you conducting on the {distressedVesselName}?] ->OfficerAboutExperiments
+ [Return.] -> Main

== AboutTheCrew
* {officerToldAboutMormo or theAI} [Tell me {AboutAI:again} about {aiName}.] -> AboutAI
* {officerToldAboutAtmosphereDr} [Tell me {OfficerAboutAtmosphereDr:more} about Dr. {atmosphereDrName}.] -> OfficerAboutAtmosphereDr
* {officerToldAboutAntagonist} [Tell me about Dr. {antagonistName}{OfficerAboutAtmosphereDr: again}.] -> OfficerAboutAntagonist
* {officerToldAboutOthers}[Tell me about the other two people who arrived with {antagonistName}.] -> OfficerAboutOtherArrivals
* [Tell me {AboutOfficer:more} about yourself.] -> AboutOfficer
* {officerToldAboutLeviAndIvanka}[Tell me {AboutLeviAndIvanka:again} about Levi and Ivanka.] -> AboutLeviAndIvanka
* [Ok, that's enough about the crew.] -> OfficerMain
+ [Return.] ->OfficerMain

== AboutAI
{"Usually {aiName} keeps the show on the road. 'Used be a dozen of us on here runnin' things but they... they  automated almost everything, put it all on {aiName} to do. Problem is, he's turned into, well... ah... a fucking idiot. It's like he's had a lobotomy." |"What {AboutAI:else} do you want to know about old {aiName}?}
    * [When did he start acting strangely?]
        "It started a few weeks ago. It was subtle at first, weird turn-of-phrase, having to have thing repeated to him. It's gotten gradually worse."
        * * {not theAI} [I'll speak with him.]
            "You can <i>try</i>."
            He shakes his head dejectedly.
        * * [TODO] 
        -> OfficerMain
    * {theAI} [Aye, I tried to speak with him but he's hard to understand.]
        "He either sounds like an idiot or a two-bit philosopher. Keeps yammering about 'ghosts in the machine' or whatever. And he's totally convinced that everything is normal! We've been locked out of the OS, the COM system, everything."
    + [Thats enough about {aiName} for now.] -> OfficerMain
- -> AboutAI

== OfficerAboutAtmosphereDr
"Dr. {atmosphereDrName}'s one of the most brilliant people I ever met. She works in nanotechnology and climate engineering and has been leading our research efforts to utilize nan-particle bot swarms to cool the planet's atmosphere. If you ask me we're about 100 years too-late, but you have to admire her dedication."

"Things have been a bit tense with her lately, ever since {antagonistName} arrived with the backing of NATO. Dr. {atmosphereDrName} was forced to shift gears since all of resources went to helping {antagonistName} with whatever the hell he's doing with the array."
+ [What is the array?]
    "It's an old large-aperture array that used to be used for astronomy and cosmology research. Back in the day, it was used to monitor extra-galactic signal events.

    We haven't used it since our focus shifted to Dr. {atmosphereDrName}'s aero-chemical research. {antagonistName} had us re-position the {distressedVesselName} to get better reception of... whatever they're looking at. Took us a whole week that did. It's totally ruined {atmosphereDrName}'s research agenda."

    + + {officerToldAboutAntagonist} [What's {antagonistName} doing with it?]
        "{antagonistName} has been all over that array since they arrived, recalibrating it, fine-tuning it component,  all sorts of scans and analyses. Don't know what they're hoping to achieve with it, everything is apparently top-secret. But this sudden shift in priorities by NATO is strange."
    + + {not officerToldAboutAntagonist} [{antagonistName}?] -> OfficerAboutAntagonist
-  
+ [Ok, enough about {atmosphereDrName}.] -> AboutTheCrew

== OfficerAboutAntagonist
~officerToldAboutOthers = true
"Real piece of shit, real intense. Arrived recently. He's like a machine, just working on the array day and night. He doesn't give a damn about the crew or what goes on around here. It's all about his precious research and whatever scheme he's cooking up."
* [When did you say he arrived?]
    "Came aboard a few weeks back, with the two goon-heads. We got a directive from NATO command to let him enter, and that our mission is now to facilitate <i>him</i>."
* [What is he like?]
    "He's very focussed, very literal. Doesn't really have an interest in mixing with everyone else."
    * * [He's shy?]
        "I wouldn't say shy, just pre-occupied. Like he has higher things on his mind."
    * * [Neurodivergent.]
        "Probably. There's an aloofness about him.
* [Do you know where he is?]
    "He spends all his time in Array Control. Dragged a cot in there on his first night and only comes out for food and to shower."
    * * [How do I get to Array Control?] -> OfficerAboutArrayControl
-    
+ [Ok, enough about him.] -> AboutTheCrew

== AboutOfficer
blah
+ [Ok, enough about you.] -> AboutTheCrew

== AboutLeviAndIvanka
He exhales sharply, contorting his face in uncontrolled emotion.

This is a sensitive topic for him.

"They... they..."
* [It's alright, lets talk about something else.] 
    "...I... yeah. Let's change the subject."
            
    He breathes deeply.
    -> OfficerMain
* [Out with it!] 
    "Please, I... I can't bear to talk about it..."
    * * [I need to know <i>everything</i> if you want me to help you.]
        "The last altitude drop, one of the TODO came down on top of their bunks... they got crushed in their sleep. I found her, them, in the morning. Jesus I hope she didn't feel anything..."
        ~knowAboutLeviIvanka = true
        ~officerCrying = true
                
        He burys his face in his hands, his breath quickening.
                
        "Please, I need... I need a moment..."
        -> Main
    * * [Fine, we'll revisit this later.]
        He breathes deeply. After taking a moment to compose himself, he straightens himself again.
        -> OfficerMain
        
== OfficerAboutExperiments
"Most of us work in aero-chemical research. We're trying to un-fuck the climate before we all end up like Amsterdam. You would need to talk to {atmosphereDrName} if you really want the details, she's the one who designed it all. But I know she wants to use nano-swarms to seed the atmosphere, absorb some of the heat. She thinks there's a way to do a controlled radiation into space."
+ [How will that fix the climate?]
    "I didn't say it would <i>fix</i> it, but I think the idea is to a controlled nano-particle release to "soak-up" the heat. After that, the swarm can be directed to move to the upper-atmosphere. Sounds a bit desperate to me, but NATO will try anything at this point..."
    + + [Return.] ->OfficerMain
+ [What can you tell me about {atmosphereDrName}?] ->OfficerAboutAtmosphereDr
+ [What do you do with the array?]
+ [Enough about that.] -> OfficerMain

== OfficerAboutOtherArrivals
"Honestly, I didn't get to know them all that well. They kept mostly to themselves, buried in their work or whatever it is they do. {antagonistName} introduced them as fellow scientists, but theres something weird about them."
+ [Weird in what way?]
    "I've worked with a lot of scientists. They tend to be odd, but in specific way. These guys weren't... "specifically odd". And I think I saw one of the carrying a gun."
    + + [A gun... what reason would there be for them to take a gun on board a static research vessel?]
        "Yes, we're not exactly on a battlefield up here."
        + + + [Where are they now?]
            "Wherever {antagonistName} is, probably. Usually they all hang around in Array Control, but I haven't been there since the last altitude drop."
            + + + [Which way to Array Control?] -> OfficerAboutArrayControl
- 
+ [Ok, enough about them.] -> AboutTheCrew

== OfficerAboutArrayControl
"TODO"
+ [Return.] -> OfficerMain