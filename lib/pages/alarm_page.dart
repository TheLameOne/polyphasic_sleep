import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/components/alarm_box.dart';
import 'package:polyphasic_sleep_new/components/alarm_component.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  int? id;
  List<int>? setup;
  String? scheduleName;
  List<bool>? alarmData;
  bool fullTime = true;

  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() {
    var box = Hive.box('myBox');
    setState(() {
      id = box.get('id');
      scheduleName = box.get('schedule_name');
      setup = box.get('setup');
      alarmData = box.get('alarm_data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            actions: [
              PopupMenuButton<int>(
                onSelected: (value) {
                  if (value == 1) {
                    setState(() {
                      fullTime = true;
                    });
                  } else if (value == 2) {
                    setState(() {
                      fullTime = false;
                    });
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 1, child: Text("24 Hrs Format")),
                  PopupMenuItem(value: 2, child: Text("12 Hrs Format")),
                ],
                offset: Offset(0, 50),
                color: Theme.of(context).colorScheme.primary,
                elevation: 2,
              ),
            ],
            title: Center(
              child: Text("A L A R M S",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 20)),
            )),
        body: (setup != null)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 1; i < setup!.length; i += 2)
                      Container(
                        child: AlarmBox(
                            alarmId: i ~/ 2,
                            // toggle: alarmData![i ~/ 2],
                            fullTime: fullTime,
                            time: setup![i].toString()),
                      )
                  ],
                ),
              )
            : Center(
                child: Text(
                  "Select schedule to edit Alarms",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ));
  }
}

// TimeOfDay _timeOfDayConvert(String time) {
//   int convertedTime = int.parse(time);
//   int hours = convertedTime ~/ 60;
//   int minutes = convertedTime % 60;
//   return TimeOfDay(hour: hours, minute: minutes);
// }

// String _convertTime(TimeOfDay timeOfDay) {
//   final hour = timeOfDay.hour;
//   final minute = timeOfDay.minute;

//   final period = hour >= 12 ? 'AM' : 'PM';
//   final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

//   final minuteStr = minute.toString().padLeft(2, '0');
//   final hour12Str = hour12.toString().padLeft(2, '0');

//   return '$hour12Str : $minuteStr $period';
// }
