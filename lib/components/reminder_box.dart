import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/util/local_notifications.dart';

class ReminderBox extends StatefulWidget {
  final int alarmId;
  final String time;
  // final bool toggle;
  final bool? fullTime;
  const ReminderBox(
      {super.key,
      required this.time,
      // required this.toggle,
      this.fullTime = true,
      required this.alarmId});

  @override
  State<ReminderBox> createState() => _ReminderBoxState();
}

class _ReminderBoxState extends State<ReminderBox> {
  List<bool>? reminderData;
  String? scheduleName;
  int? reminderTime;
  @override
  void initState() {
    _loadReminders();
    super.initState();
  }

  _loadReminders() {
    var box = Hive.box('myBox');
    setState(() {
      reminderData = box.get('reminder_data');
      reminderTime = box.get('reminder_time');
      scheduleName = box.get('schedule_name');
    });
    // print(box.get('reminder_data'));
    // print(box);
    // print(id);
    // print(toggleButton);
  }

  _updateReminder() async {
    var box = Hive.box('myBox');
    await box.put('reminder_data', reminderData);
  }

  _setReminder(TimeOfDay time, String schdeuleName, int id) {
    // print(id);
    LocalNotifications.showScheduleNotification(
        id: id,
        title: "This is $schdeuleName",
        body: "Time to Sleep",
        payload: "payload",
        time: timeOfDayToDateTime(time));
    // LocalNotifications.showSimpleNotification(
    //     title: "This is $schdeuleName",
    //     body: "Time to Sleep",
    //     payload: "payload");
  }

  _deleteReminder(int id) {
    // print(id);
    LocalNotifications.cancel(id);
  }

  DateTime timeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    DateTime todayDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // If the time is earlier than the current time, set the date to tomorrow
    if (todayDateTime.isBefore(now)) {
      todayDateTime = todayDateTime.add(const Duration(days: 1));
    }

    return todayDateTime;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 4, bottom: 4, right: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20)),
        width: size.width - 16,
        height: size.height * 0.14,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (widget.fullTime!)
                  ? Row(children: [
                      Text(
                        _timeOfDayConvert(widget.time.toString())
                            .hour
                            .toString()
                            .padLeft(2, '0'),
                        style: TextStyle(
                            fontSize: 32,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: (reminderData![widget.alarmId])
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Text(
                          ":",
                          style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontWeight: (reminderData![widget.alarmId])
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                      Text(
                        _timeOfDayConvert(widget.time.toString())
                            .minute
                            .toString()
                            .padLeft(2, '0'),
                        style: TextStyle(
                            fontSize: 32,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: (reminderData![widget.alarmId])
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _convertTime(_timeOfDayConvert(widget.time)),
                          style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontWeight: (reminderData![widget.alarmId])
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        const SizedBox(width: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, bottom: 8.0),
                          child: Text(
                            _ampm(_timeOfDayConvert(widget.time)),
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontWeight: (reminderData![widget.alarmId])
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        )
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  (reminderData![widget.alarmId])
                      ? Text(_tomorrow(_timeOfDayConvert(widget.time)),
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ))
                      : Text(
                          "Not Scheduled",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                  Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveTrackColor:
                          Theme.of(context).colorScheme.onPrimary,
                      inactiveThumbColor: Theme.of(context).colorScheme.primary,
                      value: reminderData![widget.alarmId],
                      onChanged: (value) {
                        if (value == true) {
                          String reminderValue = _timeDifference(
                              _timeOfDayConvert(widget.time), reminderTime!);
                          _setReminder(_timeOfDayConvert(widget.time),
                              scheduleName!, int.parse(widget.time));
                          Fluttertoast.showToast(
                              msg: "Reminder Set for $reminderValue from now",
                              fontSize: 12);
                        }
                        if (value == false) {
                          _deleteReminder(int.parse(widget.time));
                        }
                        setState(() {
                          _updateReminder();
                          reminderData![widget.alarmId] = value;
                        });
                      }),
                  // Testing reminders
                  // InkWell(
                  //   onTap: () => _setReminder(
                  //       TimeOfDay(hour: 20, minute: 39), "uberman", 1),
                  //   child: Container(
                  //     child: Text("set"),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () => _deleteReminder(1),
                  //   child: Container(
                  //     child: Text("del"),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _tomorrow(TimeOfDay time) {
  final now = TimeOfDay.now();
  final nowDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    now.hour,
    now.minute,
  );
  final providedDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    time.hour,
    time.minute,
  );

  Duration difference;
  if (providedDateTime.isBefore(nowDateTime)) {
    difference =
        providedDateTime.add(Duration(days: 1)).difference(nowDateTime);
  } else {
    difference = providedDateTime.difference(nowDateTime);
  }
  final hours = difference.inHours;
  final minutes = difference.inMinutes % 60;
  if (hours > 0) {
    return '$hours Hours and $minutes Minutes';
  } else {
    return '$minutes Minutes';
  }
}

String _timeDifference(TimeOfDay givenTime, int reminderTime) {
  TimeOfDay currentTime = TimeOfDay.now();
  final currentMinutes = currentTime.hour * 60 + currentTime.minute;
  final givenMinutes = givenTime.hour * 60 + givenTime.minute;
  int differenceInMinutes = givenMinutes - currentMinutes;
  if (differenceInMinutes < 0) {
    differenceInMinutes += 24 * 60;
  }
  final hours = differenceInMinutes ~/ 60;
  final minutes = differenceInMinutes % 60;
  String formattedDifference = '';
  if (hours > 0) {
    formattedDifference += '$hours hour${hours > 1 ? 's' : ''}';
  }
  if (hours > 0 && minutes > 0) {
    formattedDifference += ' and ';
  }
  if (minutes > 0) {
    formattedDifference += '$minutes minute${minutes > 1 ? 's' : ''}';
  }
  return formattedDifference;
}

TimeOfDay _timeOfDayConvert(String time) {
  int convertedTime = int.parse(time);
  int hours = convertedTime ~/ 60;
  int minutes = convertedTime % 60;
  return TimeOfDay(hour: hours, minute: minutes);
}

String _convertTime(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hour;
  final minute = timeOfDay.minute;
  final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
  final minuteStr = minute.toString().padLeft(2, '0');
  final hour12Str = hour12.toString().padLeft(2, '0');

  return '$hour12Str:$minuteStr';
}

String _ampm(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hour;
  final period = hour >= 12 ? 'pm' : 'am';
  return period;
}
