import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:polyphasic_sleep_new/components/reminder_box.dart';
import 'package:polyphasic_sleep_new/util/local_notifications.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  int? id;
  List<int>? setup;
  String? scheduleName;
  List<bool>? reminderData;
  int? reminderTime;
  bool fullTime = true;

  @override
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
      reminderData = box.get('reminder_data');
      reminderTime = box.get('reminder_time');
    });
  }

  _setReminderTime() {
    Fluttertoast.showToast(msg: "Reminders updated succefully");
  }

  _setReminder() async {
    var box = Hive.box('myBox');
    await box.put('reminder_time', reminderTime);
    setState(() {
      // setup = setup!.map((entry) => entry + reminderTime!).toList();
    });
  }

  _resetReminder() async {
    var box = Hive.box('myBox');
    reminderData?.fillRange(0, reminderData!.length, false);
    await box.put('reminder_data', reminderData);
    LocalNotifications.cancelAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   // isExtended: true,
        //   child: Icon(Icons.check),
        //   backgroundColor: Colors.blue,

        //   onPressed: () {
        //     setState(() {
        //       _setReminderTime();
        //       _resetReminder();
        //     });
        //   },
        // ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            actions: (id != null)
                ? [
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
                        PopupMenuItem(
                            value: 1,
                            child: Text(
                              "24 Hrs Format",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            )),
                        PopupMenuItem(
                            value: 2,
                            child: Text("12 Hrs Format",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer))),
                      ],
                      offset: const Offset(0, 50),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      elevation: 2,
                    ),
                  ]
                : [],
            title: Center(
              child: Text("R E M I N D E R S",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20)),
            )),
        body: (setup != null)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            child: NumberPicker(
                              itemCount: 5,
                              itemWidth: 60,
                              selectedTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                              textStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.8)),
                              maxValue: 60,
                              minValue: 0,
                              axis: Axis.horizontal,
                              value: reminderTime!,
                              onChanged: (value) {
                                setState(() {
                                  reminderTime = value;
                                  // print(reminderTime);
                                  // print((setup![0] - reminderTime!).toString());
                                  _setReminder();
                                  _resetReminder();
                                });
                              },
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(16),
                              //   border: Border.all(color: Colors.black26),
                              // ),
                              haptics: true,

                              // decoration: BoxDecoration(color: Colors.red),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "minutes to remind yourself before each schedule",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.6)),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < setup!.length; i += 2)
                          Container(
                            child: ReminderBox(
                                alarmId: i ~/ 2,
                                // toggle: alarmData![i ~/ 2],
                                fullTime: fullTime,
                                time: (setup![i] - reminderTime! < 0)
                                    ? (1440 - reminderTime! + setup![i])
                                        .toString()
                                    : (setup![i] - reminderTime!).toString()),
                          )
                      ],
                    ),
                    const SizedBox(height: 8)
                  ],
                ),
              )
            : Center(
                child: Text(
                  "Select schedule to edit Reminders",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
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

//   final period = hour >= 12 ? 'PM' : 'AM';
//   final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

//   final minuteStr = minute.toString().padLeft(2, '0');
//   final hour12Str = hour12.toString().padLeft(2, '0');

//   return '$hour12Str : $minuteStr $period';
// }
