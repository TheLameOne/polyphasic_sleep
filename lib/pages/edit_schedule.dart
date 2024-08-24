import 'dart:convert';
import 'package:action_slider/action_slider.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/models/setup_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart' as rootbundle;

class EditSchedule extends StatefulWidget {
  // final List<({int s, int e})> setupData;
  const EditSchedule({super.key});

  @override
  State<EditSchedule> createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  int formatSwitch = 0;
  double offset = 263;
  int additionalSleep = 0;
  int currentFormat = 0;
  double rotateChart = 263;
  List<({int s, int e})> setupData = [];
  List<({int s, int e})> finalData = [];
  var radialValue = 0.0;
  // print("Data" + data.scheduleName);
  int? id;
  String? scheduleName;
  List<int>? setup;
  String? svg;
  String? totalSleep;

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
      svg = box.get('svg');
      totalSleep = box.get('total_sleep');
      setupData = convertToTuple(setup!);
      finalData = [...setupData];
      // print("$id, $scheduleName, $setup, $svg, $totalSleep");
      if (setupData.last.s != 0)
        setState(() {
          rotateChart = (setupData.last.e.toDouble() * 360 / 1440);
        });
    });
  }

  void updateValues(int value) {
    setState(() {
      for (int i = 0; i < finalData.length; i++) {
        finalData[i] = (
          s: (setupData[i].s + value) % 1440,
          e: (setupData[i].e + value) % 1440
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(_convertName(scheduleName.toString()),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 20)),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 8.0),
        //     child: InkWell(
        //         onTap: () {
        //           setState(() {
        //             radialValue = 0;
        //             updateValues(0);
        //           });
        //         },
        //         child: Icon(Icons.refresh)),
        //   )
        // ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width - 4,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Transform.rotate(
                        angle: ((radialValue) * math.pi / 180 / 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PieChart(PieChartData(
                              startDegreeOffset: offset + rotateChart,
                              sectionsSpace: 0,
                              sections: _list(setupData))),
                        ),
                      ),
                      PieChart(PieChartData(startDegreeOffset: 263, sections: [
                        for (int i = 0; i < 24; i++)
                          PieChartSectionData(
                              value: 100 / 24,
                              color: Colors.black54,
                              title: "$i:00",
                              titleStyle: const TextStyle(fontSize: 12),
                              radius: 2,
                              titlePositionPercentageOffset: 10),
                      ])),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Sleep",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(totalSleep.toString(),
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sleep Cycles",
                    style: TextStyle(fontSize: 26),
                  ),
                  FlutterToggleTab(
                    width: 20, // width in percent
                    borderRadius: 10,
                    height: 30,
                    selectedIndex: formatSwitch,
                    selectedBackgroundColors: const [
                      Colors.blue,
                      Colors.blueAccent
                    ],
                    unSelectedBackgroundColors: const [
                      Colors.grey,
                      Colors.blueGrey
                    ],
                    selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    unSelectedTextStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    labels: const ["24", "12"],
                    selectedLabelIndex: (index) {
                      setState(() {
                        formatSwitch = index;
                        currentFormat = formatSwitch;
                      });
                    },
                    isScroll: false,
                  ),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           radialValue = radialValue - 1;
                  //           updateValues(radialValue.toInt());
                  //           // Haptic Feedback
                  //         });
                  //       },
                  //       child: Icon(
                  //         Icons.remove_circle_outline,
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //     SizedBox(width: 4),
                  //     InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           radialValue = radialValue + 1;
                  //           updateValues(radialValue.toInt());
                  //           // Haptic Feedback
                  //         });
                  //       },
                  //       child: Icon(
                  //         Icons.add_circle_outline_rounded,
                  //         color: Colors.green,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     for (int i = 0; i < setupData.length; i++)
            //       Row(
            //         children: [
            //           // cycle
            //           Text(
            //             "Sleep " + (i + 1).toString(),
            //             style: TextStyle(fontSize: 18),
            //           ),
            //           // time
            //           Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: Colors.grey,
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(4.0),
            //                 child: Text(
            //                   _convertTimeToSmallTime(
            //                       _timeOfDayConvert(setupData[i].s.toString()),
            //                       _timeOfDayConvert(setupData[i].e.toString())),
            //                   style: TextStyle(fontSize: 14),
            //                 ),
            //               )),
            //           // time start
            //           NeuBox(
            //             padding: false,
            //             child: Padding(
            //               padding: const EdgeInsets.all(4.0),
            //               child: Container(
            //                 // color: Colors.amber,
            //                 child: Row(
            //                   children: [
            //                     (currentFormat == 0)
            //                         ? Row(children: [
            //                             Text(
            //                               _timeOfDayConvert(
            //                                       finalData[i].s.toString())
            //                                   .hour
            //                                   .toString()
            //                                   .padLeft(2, '0'),
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                             Text(
            //                               " : ",
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                             Text(
            //                               _timeOfDayConvert(
            //                                       finalData[i].s.toString())
            //                                   .minute
            //                                   .toString()
            //                                   .padLeft(2, '0'),
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                           ])
            //                         : Text(
            //                             _convertTime(_timeOfDayConvert(
            //                                 finalData[i].s.toString())),
            //                             style: TextStyle(fontSize: 18),
            //                           )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(width: 8),
            //           NeuBox(
            //             padding: false,
            //             child: Padding(
            //               padding: const EdgeInsets.all(4.0),
            //               child: Container(
            //                 // color: Colors.green,
            //                 child: Row(children: [
            //                   (currentFormat == 0)
            //                       ? Row(
            //                           children: [
            //                             Text(
            //                               _timeOfDayConvert(
            //                                       finalData[i].e.toString())
            //                                   .hour
            //                                   .toString()
            //                                   .padLeft(2, '0'),
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                             Text(
            //                               " : ",
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                             Text(
            //                               _timeOfDayConvert(
            //                                       finalData[i].e.toString())
            //                                   .minute
            //                                   .toString()
            //                                   .padLeft(2, '0'),
            //                               style: TextStyle(fontSize: 18),
            //                             ),
            //                           ],
            //                         )
            //                       : Text(
            //                           _convertTime(_timeOfDayConvert(
            //                               finalData[i].e.toString())),
            //                           style: TextStyle(fontSize: 18),
            //                         )
            //                 ]),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )

            //     // time end
            //   ],
            // ),
            for (int i = 0; i < setupData.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(data),
                    Row(
                      children: [
                        Text(
                          "Sleep " + (i + 1).toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 4),
                        // 20m
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _convertTimeToSmallTime(
                                    _timeOfDayConvert(
                                        setupData[i].s.toString()),
                                    _timeOfDayConvert(
                                        setupData[i].e.toString())),
                                style: TextStyle(fontSize: 14),
                              ),
                            )),
                      ],
                    ),
                    // start time
                    Row(
                      children: [
                        NeuBox(
                          padding: false,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // color: Colors.amber,
                              child: Row(
                                children: [
                                  (currentFormat == 0)
                                      ? Row(children: [
                                          Text(
                                            _timeOfDayConvert(
                                                    finalData[i].s.toString())
                                                .hour
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            " : ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            _timeOfDayConvert(
                                                    finalData[i].s.toString())
                                                .minute
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ])
                                      : Text(
                                          _convertTime(_timeOfDayConvert(
                                              finalData[i].s.toString())),
                                          style: TextStyle(fontSize: 18),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        NeuBox(
                          padding: false,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // color: Colors.green,
                              child: Row(children: [
                                (currentFormat == 0)
                                    ? Row(
                                        children: [
                                          Text(
                                            _timeOfDayConvert(
                                                    finalData[i].e.toString())
                                                .hour
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            " : ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            _timeOfDayConvert(
                                                    finalData[i].e.toString())
                                                .minute
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        _convertTime(_timeOfDayConvert(
                                            finalData[i].e.toString())),
                                        style: TextStyle(fontSize: 18),
                                      )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // end time
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(
      BuildContext context, int i, String s, TimeOfDay selectedTime) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });
    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  TimeOfDay _timeOfDayConvert(String time) {
    int convertedTime = int.parse(time);
    int hours = convertedTime ~/ 60;
    int minutes = convertedTime % 60;
    return TimeOfDay(hour: hours, minute: minutes);
  }

  int roundToNearestFive(int value) {
    int remainder = value % 5;
    if (remainder < 2.5) {
      return value - remainder;
    } else {
      return value + (5 - remainder);
    }
  }

  int roundToNearestFifteen(int value) {
    int remainder = value % 15;
    if (remainder < 7.5) {
      return value - remainder;
    } else {
      return value + (15 - remainder);
    }
  }

  String _convertTime(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour;
    final minute = timeOfDay.minute;

    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

    final minuteStr = minute.toString().padLeft(2, '0');
    final hour12Str = hour12.toString().padLeft(2, '0');

    return '$hour12Str : $minuteStr $period';
  }

  String _convertTimeToSmallTime(TimeOfDay startTime, TimeOfDay endTime) {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;
    int differenceInMinutes = endMinutes - startMinutes;
    if (differenceInMinutes < 0) {
      differenceInMinutes += 24 * 60;
    }
    final hours = differenceInMinutes ~/ 60;
    final minutes = differenceInMinutes % 60;
    String formattedTime = '';
    if (hours > 0) {
      formattedTime += '${hours}H ';
    }
    if (minutes > 0) {
      formattedTime += '${minutes.toString().padLeft(2, '0')}M';
    }
    return formattedTime.trim();
  }
}

List<int> replace(List<int> list) {
  if (list.length >= 2 && list[1] > list[0]) {
    list.add(list[0]);
    list.add(list[1]);
    list.removeRange(0, 2);
  }
  return list;
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

List<int> convertToList(List<({int s, int e})> dataTuples) {
  List<int> result = [];

  for (var tuple in dataTuples) {
    result.add(tuple.s);
    result.add(tuple.e);
  }
  return result;
}

List<({int s, int e})> convertToTuple(List<int> dataBefore) {
  List<({int s, int e})> result = [];
  for (int i = 0; i < dataBefore.length; i += 2) {
    result.add((s: dataBefore[i], e: dataBefore[i + 1]));
  }
  result.sort((a, b) => a.s.compareTo(b.s));
  return result;
}

void _saveData(SetupModel data) async {
  // print("Data" + data.scheduleName);
  var box = Hive.box('myBox');
  await box.put('id', data.id);
  await box.put('schedule_name', data.scheduleName);
  await box.put('setup', data.setup);
  await box.put('svg', data.svg);
  await box.put('total_sleep', data.totalSleep);

  // print(box.get('id'));
  // print(box.get('schedule_name'));
  // print(box.get('setup'));
  // print(box.get('svg'));
  // print(box.get('total_sleep'));
}

void _stopAlarm() async {
  await Alarm.stop(1);
}

void _setupAlarm() async {
  await Alarm.set(
      alarmSettings: AlarmSettings(
          id: 1,
          dateTime: DateTime.now(),
          assetAudioPath: 'assets/alarm/alarm.mp3',
          notificationTitle: 'This is the title',
          notificationBody: 'This is the body'));
}

List<PieChartSectionData> _list(List<({int s, int e})> v) {
  int temp = 0;
  List<({int s, int e})> value = [...v];
  List<int> list = [];
  for (int i = 0; i < value.length; i++) {
    if (value[i].e > value[i].s) {
      list.add((value[i].s - temp) * -1);
      list.add(value[i].e - value[i].s);
      temp = value[i].e;
    } else {
      list.add((value[i].s - value[i - 1].e) * -1);
      list.add(1440 - value[i].s + value[i].e);
    }
  }
  if (v.last.e > v.last.s) {
    list[0] = list[0] - 1440 + v.last.e;
  }
  if (v.last.e < v.last.s) {
    list[0] = list[0] + v.last.e;
  }
  return _sections(list);
}

List<PieChartSectionData> _sections(List<int> list) {
  List<PieChartSectionData> sleep = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > 0) {
      sleep.add(PieChartSectionData(
          titleStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          value: list[i].toDouble(),
          color: Colors.red,
          showTitle: false,
          title: list[i].toString()));
    } else {
      sleep.add(PieChartSectionData(
          titleStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          value: list[i].abs().toDouble(),
          color: Colors.black12,
          showTitle: false));
    }
  }
  return sleep;
}