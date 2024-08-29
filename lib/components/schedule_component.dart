import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:polyphasic_sleep_new/pages/schedule_types_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleComponent extends StatelessWidget {
  final String name;
  final String desc;
  final String difficulty;
  final String totalSleep;
  final String svgPath;
  final String link;
  final int chartId;
  final List<int> contains;

  const ScheduleComponent(
      {super.key,
      required this.name,
      required this.desc,
      required this.difficulty,
      required this.totalSleep,
      required this.svgPath,
      required this.link,
      required this.contains,
      required this.chartId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScheduleTypesPage(
                      contains: contains,
                      title: _convertName(name),
                    )));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.7),
              borderRadius: BorderRadius.circular(15)),
          // height: size.height * 0.1,
          // width: (size.width - 24),
          child: Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            elevation: 0,
            child: SizedBox(
              height: size.height * 0.3,
              width: size.width - 16,
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black),
              //     borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _convertName(name),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 32,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              _launchURL(link);
                            },
                            child: Icon(
                              Icons.info_outline_rounded,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              size: 26,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              height: size.height * 0.12,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  desc,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                      fontSize: 14,
                                      overflow: TextOverflow.clip),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text("Difficulty : ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip)),
                                Text(difficulty.toUpperCase(),
                                    style: TextStyle(
                                        color: _difficultyColor(difficulty),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text("Total Sleep : ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip)),
                                Text(totalSleep,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        fontSize: 16,
                                        overflow: TextOverflow.clip)),
                              ],
                            )
                          ],
                        ),
                        Container(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          height: size.height * 0.2,
                          width: size.width * 0.3,
                          child: SvgPicture.asset(
                            svgPath,
                          ),
                          // PieChart(PieChartData(
                          //     centerSpaceRadius: 40,
                          //     startDegreeOffset: 263,
                          //     sectionsSpace: 0,
                          //     sections: _list(value))
                          //     ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

_difficultyColor(String name) {
  if (name == "Extreme") {
    return Colors.red;
  }
  if (name == "Moderate") {
    return Colors.green;
  }
  if (name == "High") {
    return const Color.fromARGB(255, 252, 180, 72);
  }
  if (name == "Very High") {
    return Color.fromARGB(255, 230, 110, 62);
  }
}

String _convertName(String name) {
  String newName = "";
  for (int i = 0; i < name.length; i++) {
    newName += name[i].toUpperCase();
    if (i != name.length - 1) {
      newName += " ";
    }
  }
  return newName;
}

_launchURL(_url) async {
  final Uri url = Uri.parse(_url);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $_url');
  }
}
