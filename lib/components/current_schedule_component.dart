import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/components/rating.dart';
import 'package:polyphasic_sleep_new/components/sleep_chart.dart';

class CurrentScheduleComponent extends StatefulWidget {
  const CurrentScheduleComponent({super.key});

  @override
  State<CurrentScheduleComponent> createState() =>
      _CurrentScheduleComponentState();
}

class _CurrentScheduleComponentState extends State<CurrentScheduleComponent> {
  int? id;
  String? scheduleName;
  String? shortDesc;
  int? difficulty;
  String? totalSleep;
  String? classification;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    var box = Hive.box('myBox');
    setState(() {
      scheduleName = box.get('schedule_name');
      id = box.get('id');
      shortDesc = box.get('short_desc');
      difficulty = box.get('difficulty');
      totalSleep = box.get('total_sleep');
      classification = box.get('classification');
    });

    // print(box.get('id'));
    // print(box.get('schedule_name'));
    // print(box.get('setup'));
    // print(box.get('svg'));
    // print(box.get('total_sleep'));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NeuBox(
      padding: false,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(15)),
        height: size.height * 0.3,
        width: size.width - 16,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (id == null)
              ? InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/allschedulespage'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "S E L E C T",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 20,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "S C H E D U L E",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 20,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () => Navigator.pushNamed(context, '/editschedule'),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _convertName(scheduleName!),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.45,
                                    child: Text(
                                      classification!,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Sleep",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                    Text(
                                      totalSleep!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Difficulty",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                    Rating(
                                        rating: difficulty!,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              // color: Colors.green,
                              height: size.height * 0.2,
                              width: size.width * 0.35,
                              child: SleepChart(id: id!))
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
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
