import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
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

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    var box = Hive.box('myBox');
    setState(() {
      scheduleName = box.get('schedule_name');
      id = box.get('id');
      shortDesc = box.get('short_desc');
      difficulty = box.get('difficulty');
      totalSleep = box.get('total_sleep');
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
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        height: size.height * 0.2,
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
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "S C H E D U L E",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () => Navigator.pushNamed(context, '/editschedule'),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _convertName(scheduleName!),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: Theme.of(context)
                              //           .colorScheme
                              //           .inversePrimary,
                              //       shape: BoxShape.circle),
                              //   child: IconButton(
                              //       onPressed: () => Navigator.pushNamed(
                              //           context, '/editschedule'),
                              //       icon: Icon(
                              //         Icons.settings,
                              //         color: Theme.of(context).colorScheme.surface,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: SleepChart(id: id!)
                            // (Provider.of<ThemeProvider>(context).isDarkMode)
                            //     ? SvgPicture.asset(
                            //         "assets/svg/dark/$svg.svg",
                            //       )
                            //     : SvgPicture.asset(
                            //         "assets/svg/light/$svg.svg",
                            //       )
                            // PieChart(PieChartData(
                            //     centerSpaceRadius: 40,
                            //     startDegreeOffset: 263,
                            //     sectionsSpace: 0,
                            //     sections: _list(value))
                            //     ),
                            )
                      ],
                    ),
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
