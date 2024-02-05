=== Officer
{The intercom voice belongs to a small man, with a slightly nervous disposition. He awkwardly raises his hand in the beginning of a wave, but thinks better of it.|His sorry gaze meets yours.}
* [Forced the mechanism with a crowbar, bit of a struggle but I'm here now.]
    "Yes, ...ah... good. Well done."
    * * [Now tell me, what's your situation?] 
        "Where do you want to start? The most important problem is our uncontrolled altitude drops. It's stabilized for now but..."
    -> OfficerMain

== OfficerMain
{|"What {Officer:else} can I do for you?"}
        * * * [What's {theAI:Mormo |your A.I.} saying? You must have asked them what the problem is?] -> AboutAI
    
+ {theAI} [Tell me about {aiName}.] -> AboutAI
* [Where is everyone?]
    "It's just me on the air-locks deck. The rest of the crew were in the lower sections last I saw, but the last fall we had was pretty sever. Thats why I couldn't open the hatch manually from this side, the {distressedVesselName} suffered a lot of damage."
    * * [Who else is on-board?]
        "There was 8 of us, but Levi and Ivanka...
        * * * [What about them?] -> AboutLeviAndIvanka
+ [Tell me about the {distressedVesselName}.]
    "The {distressedVesselName} is a High Altitude Platform, our focus is science and research. We're high enough to get  for observation work, and for conducting atmospheric experiments which are impossible at normal altitudes."
    * * [Who's in charge?]
    "In charge? I guess {antagonistName} is technically in charge."
        * * * [What do you mean by "technically"?]
            "We're a research platform, there's no heirarchy as such. Most of the crew are scientists, either for the atmosphere experiments or for monitoring the array.
            * * * * [I didn't realize you were communisits. So {antagonistName} is in charge <i>practically speaking</i>?]
                "{antagonistName}'s the most senior Scientist. Came on board a few weeks ago, him and another two. Command had us completely change our plan; that set the Dr. {atmosphereDrName}'s experiments back months. He was <i>pissed</i>."
                    * * * * * [Tell me more about this {antagonistName}.] -> AboutAntagonist
                    * * * * * [Who is {atmosphereDrName}.] -> AboutAntagonist
                * * * * * [Tell me about Dr. {atmosphereDrName}.] -> AboutAtmosphereDr
            * * * * [Atmosphere experiments?]
            * * * * [Monitoring the array?]
    + + [I want to know about the crew.] -> AboutTheCrew
+ [Return.] -> Main

== AboutTheCrew
+ [Tell me {AboutAI:again} about {aiName}.] -> AboutAI
+ [Tell me {AboutAtmosphereDr:more} about Dr. {atmosphereDrName}.] -> AboutAtmosphereDr
+ [Tell me about Dr. {antagonistName}{AboutAtmosphereDr: again}.] -> AboutAntagonist
+ [Tell me {AboutOfficer:more} about yourself.] -> AboutOfficer
+ [Tell me {AboutLeviAndIvanka:again} about Levi and Ivanka.] -> AboutLeviAndIvanka
+ [Ok, that's enough about the crew.] -> OfficerMain
== AboutAI
{"Well, usually {aiName} keeps the show on the road. 'Used be a twelve of us on here runnin' things but they... they  automated almost everything by having {aiName} do it. Problem is, he's turned into, well... ah... a fucking idiot. It's like he's had a lobotomy." |"What {AboutAI:else} do you want to know about old {aiName}?}
    * [When did he start acting strangely?]
        "About 3 or 4 days ago maybe?"
        * * {not theAI} [I'll speak with him.]
            "You can <i>try</i>."
            He shakes his head dejectedly.
        * * [TODO] 
        -> OfficerMain
    * {theAI} [Aye, I tried to speak with him but he's hard to understand.]
        "He either sounds like an idiot or a two-bit philosopher. Keeps yammering about 'ghosts in the machine' or whatever. And he's totally convinced that everything is normal! We've been locked out of the OS, the COM system, everything."
    + [Thats all for now.] -> OfficerMain
- -> AboutAI

== AboutAtmosphereDr
blah
+ [Ok, enough about him.] -> AboutTheCrew

== AboutAntagonist
blah
+ [Ok, enough about her.] -> AboutTheCrew

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
        

