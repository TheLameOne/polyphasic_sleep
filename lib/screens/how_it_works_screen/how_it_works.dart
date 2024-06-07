import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/custom/bullet_list.dart';
import 'package:polyphasic_sleep/custom/heading.dart';
import 'package:polyphasic_sleep/custom/justify_text.dart';

import '../../custom/custom_container.dart';

class HowItWorks extends StatefulWidget {
  static const String routeNamed = "HowItWorks";

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading(data: "Introduction"),
                    JustifyText(
                      data:
                          "In this how it works section, you will have a lot of opportunities to learn about several mechanics of polyphasic sleeping. Explaining how the whole thing works seems very complicated, but our resources will help you learn as much as possible about polyphasic sleeping.",
                    ),
                    JustifyText(
                        data:
                            "This includes a vast array of information on the following:"),
                    BulletList(data: [
                      "All sleep stages",
                      "What to do BEFORE you choose your polyphasic schedule",
                      "Biological rhythms and especially the circadian rhythm in humans",
                      "How the regular sleep cycle on monophasic sleep changes on a polyphasic schedule",
                      "Other sleep phenomena such as: Wake Maintenance Zone, minimum sleep threshold for long-term health, etc.",
                      "Research on polyphasic sleep"
                    ]),
                    Heading(data: "Sleep Stages 101"),
                    // Containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.cyan,
                          data: "NREM1",
                          noOfItems: 5,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.cyan,
                          data: "NREM2",
                          noOfItems: 5,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.cyan,
                          data: "SWS",
                          noOfItems: 5,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.cyan,
                          data: "REM",
                          noOfItems: 5,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.cyan,
                          data: "Sleep Cycle",
                          noOfItems: 5,
                        ),
                      ],
                    ),
                    JustifyText(
                        data:
                            "Under this section, you will learn more about how different sleep stages play various roles in human health. Furthermore, their mechanics and relevance with polyphasic sleeping will be further explored. "),
                    JustifyText(
                        data:
                            "With this section, we want to spread the message about certain misconceptions and myths over these sleep stages. These myths have perpetuated for years in the community and they need to go. In addition, do not forget to check out how your own sleep cycle may change on a polyphasic schedule as well!"),
                    Heading(data: "Why Polyphasic Sleep Works"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.yellow,
                          data: "Repartitioning: Prioritizing Vital Sleep",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.yellow,
                          data: "Minimum Sleep Threshold: How Low Can You Go",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.yellow,
                          data: "Wake Time Programming – Wake up EASILY!",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.yellow,
                          data: "Why Shortened Monophasic DOES NOT WORK",
                        ),
                      ],
                    ),
                    // Animation
                    JustifyText(
                        data: "Can I reduce more sleep than this Siesta?"),
                    JustifyText(
                        data:
                            "Alright, since you have read about the sleep stages, it's time for an even more interesting section. You have read from a lot of Internet sources that flat out refute the feasibility of polyphasic sleep. Yes, without giving much reason other than “perpetual sleep deprivation“, whatever that may mean…"),
                    JustifyText(
                        data:
                            "Do not worry, you have arrived at the right place. With the display of more EEG readings, we hope to prove that polyphasic sleep, on the contrary, is a truly viable sleep regime."),
                    JustifyText(
                      data:
                          "Keep in mind, though, there are A LOT of options for you to pick, especially if you're a beginner! ",
                    ),
                    JustifyText(
                        data:
                            "Keep in mind, though, there are A LOT of options for you to pick, especially if you're a beginner! "),
                    Heading(
                        data:
                            "Sleep Mechanics: Conquer YOUR Body and Use it to Your Advantage"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Biological Rhythms",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Glymphatic System",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Sleep Pressure",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Wake After Sleep Onset",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          width: 160,
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Wake Maintenance Zone",
                          noOfItems: 2,
                        ),
                        CustomContainer(
                          width: 160,
                          borderColor: Colors.black87,
                          color: Colors.green,
                          data: "Determining SWS & REM Peaks",
                          noOfItems: 2,
                        ),
                      ],
                    ),
                    JustifyText(
                        data:
                            "Over ~20 years since polyphasic sleep made a big wave with schedules like Uberman and Dymaxion, now there is even more stuff for you to learn! However, this section is a bit more advanced; after understanding how it works, it will help you think through things more carefully. "),
                    JustifyText(
                        data:
                            "While these mechanics may appear negative as you read them, you can actually use them to your advantage! It takes incremental change in sleep habits, one step at a time! Your adaptation may go smoother or rougher depending on how well you apply these concepts. Good luck! "),
                    Heading(data: "Reasons to Pursue a Polyphasic Schedule"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Starting a Polyphasic Lifestyle",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Advantages of Polyphasic Sleep",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Disadvantages of Polyphasic Sleep",
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Naturally Segmented Sleepers",
                        ),
                      ],
                    ),
                    JustifyText(
                        data:
                            "If you are fascinated enough by the concepts of polyphasic sleeping so far, let’s take one step further! This section details certain reasons why a polyphasic schedule can be good for you. Furthermore, you may have already been a natural polyphasic sleeper without knowing. (Hello, Segmented sleep?)"),
                    JustifyText(
                        data:
                            "As always, though, it is also necessary to look at different ends of the spectrum to be aware of how polyphasic sleep may not entirely work for you, or suit your timetable. "),
                    Heading(data: "Research & Resources"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Peer-reviewed Research",
                          noOfItems: 3,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Community Research Effort",
                          noOfItems: 3,
                        ),
                        CustomContainer(
                          borderColor: Colors.black87,
                          color: Colors.red,
                          data: "Polyphasic Sleep Resources",
                          noOfItems: 3,
                        ),
                      ],
                    ),
                    JustifyText(
                        data:
                            "Phew! After understanding basic materials, you totally can start kicking ass with your own adaptation and thorough preparation. "),
                    JustifyText(
                        data:
                            "However, if you are curious about polyphasic sleeping behavior in humans, definitely consider checking out these alternative resources and research on polyphasic sleep in humans. If you are interested in helping us with our ongoing projects, you are more than welcome anytime. Enjoy our collection! ")
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
