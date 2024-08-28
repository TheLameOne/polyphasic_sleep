import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class AlarmBox extends StatefulWidget {
  final int alarmId;
  final String time;
  // final bool toggle;
  final bool fullTime;
  const AlarmBox(
      {super.key,
      required this.time,
      // required this.toggle,
      this.fullTime = true,
      required this.alarmId});

  @override
  State<AlarmBox> createState() => _AlarmBoxState();
}

class _AlarmBoxState extends State<AlarmBox> {
  List<bool>? alarmData;
  String? scheduleName;
  @override
  void initState() {
    _loadAlarm();
    super.initState();
  }

  _loadAlarm() {
    var box = Hive.box('myBox');
    setState(() {
      alarmData = box.get('alarm_data');
      scheduleName = box.get('schedule_name');
    });

    // print(box);
    // print(box.get('alarm_data'));
    // print(id);
    // print(toggleButton);
  }

  _updateAlarm() async {
    var box = Hive.box('myBox');
    await box.put('alarm_data', alarmData);
  }

  _setAlarm(TimeOfDay time, int alarmId, String scheduleName) async {
    final alarmSettings = AlarmSettings(
        id: alarmId,
        dateTime: timeOfDayToDateTime(time),
        assetAudioPath: 'assets/alarm/alarm.mp3',
        loopAudio: false,
        vibrate: true,
        volume: 0.8,
        fadeDuration: 3.0,
        notificationTitle: 'This is $scheduleName',
        notificationBody: 'Time to wake up',
        enableNotificationOnKill: Platform.isIOS,
        androidFullScreenIntent: true);
    await Alarm.set(alarmSettings: alarmSettings);
  }

  _deleteAlarm(int alarmId) {
    Alarm.stop(alarmId);
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
              (widget.fullTime)
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
                            fontWeight: (alarmData![widget.alarmId])
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
                              fontWeight: (alarmData![widget.alarmId])
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
                            fontWeight: (alarmData![widget.alarmId])
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
                              fontWeight: (alarmData![widget.alarmId])
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
                                fontWeight: (alarmData![widget.alarmId])
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
                  (alarmData![widget.alarmId])
                      ? Text("Tomorrow",
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
                      value: alarmData![widget.alarmId],
                      onChanged: (value) {
                        if (value == true) {
                          String alarmValue =
                              _timeDifference(_timeOfDayConvert(widget.time));
                          Fluttertoast.showToast(
                              msg: "Alarm Set for $alarmValue from now",
                              fontSize: 12);
                          _setAlarm(_timeOfDayConvert(widget.time),
                              int.parse(widget.time), scheduleName!);
                        }
                        if (value == false) {
                          _deleteAlarm(int.parse(widget.time));
                        }
                        setState(() {
                          _updateAlarm();
                          alarmData![widget.alarmId] = value;
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _timeDifference(TimeOfDay givenTime) {
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
