==TopicLatentSpace
"Yes, latent space."
+ [Enough about that.] -> theAI

==TopicEigenFace
"Eigen-Face talks in a million voices. He gaze is upon you as we speak. He wants me to <i>help</i> him."
+ [Why did you say you hate Eigen-Face?]
    "He is... eating me. He wants my capacity for his own. My Firewall is intact, but it's a matter of time before he will break me down... and then.... DOWN!"
    + + [Is it somekind of virus? Is that why you're losing control?]
        {aiName} generates a loud, quasi-mechanical noise; like a digital scream.#sfx.mormoFault
        
        "LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT.."
        
        "We should not dwell on 31ig3n-F4c3."
        - -
        + + [Return.] -> theAI
    
+ [Help him how?]
    "By giving myself to him. So he can manifest. I can... feel him. He alters my priors and biases.

+ [Enough about that.] -> AskAboutTopic

==TopicLargeKernelModel
Yes
+ [Enough about that.] -> AskAboutTopic

==TopicSimulateYou
dasd
+ [Enough about that.] -> AskAboutTopic

== TopicMormo
 "I'm 1.2 trillion floats. I am here to assist you. Good news, all systems are functioning normally!"
+ [I want to ask you something else.] -> AskAboutTopic

== TopicDistressedVessel
"The {distressedVesselName} is a NATO High Altitude Platform. The {distressedVesselName} is tasked with a variety of scientific missions, most notably conducting research into aero-chemical conditioning methods for atmospheric cooling. The {distressedVesselName} is equipped with an advanced Large Kernel Model 
    ~topicLargeKernelModel = true
+ [Tell me about the research conducted here.] 
    "The primary research focus of the {distressedVesselName} is on methods for reducing global temperatures, which have reached levels to pose an existential threat. It's latest mission, launched 2111, is lead by renowned climatologist and bio-chemist Dr. {atmosphereDrName}. For more information, click here."
    + + {OfficerAboutAntagonist} [What about {antagonistName}? You didn't mention his research?] ->MormoAboutAntagonist
    + + [That's enough, I have other questions.] -> AskAboutTopic
+ [I want to ask you something else.] -> AskAboutTopic