import 'dart:convert';
import 'package:action_slider/action_slider.dart';
import 'package:alarm/alarm.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:hive/hive.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/models/setup_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;

class SetupPage extends StatefulWidget {
  // final List<({int s, int e})> setupData;
  final int id;
  const SetupPage({super.key, required this.id});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  double offset = 263;
  int formatSwitch = 0;
  int additionalSleep = 0;
  int currentFormat = 0;
  double rotateChart = 263;
  Future<SetupModel> fetchData(int id) async {
    // Load the JSON file
    final jsondata = await rootBundle.loadString('json/types.json');
    // Decode the JSON data into a list of dynamic objects
    final list = json.decode(jsondata) as List<dynamic>;

    // Convert each item in the list to an instance of SetupModel
    final schedules = list.map((json) => SetupModel.fromJson(json)).toList();

    // Find the schedule with the matching id
    return schedules.firstWhere(
      (schedule) => schedule.id == id,
    );
  }

  List<({int s, int e})> setupData = [];
  List<({int s, int e})> finalData = [];

  SetupModel? data;
  var radialValue = 0.0;

  @override
  void initState() {
    _loadData();
    // print(setupData);
    super.initState();
  }

  void _loadData() async {
    data = await fetchData(widget.id);
    print(data!.classification);
    if (data != null) {
      setupData = convertToTuple(replace(data!.setup));
      finalData = [...setupData];
      setState(() {});
    } else {
      print('No data found for id ${widget.id}');
    }
    if (setupData.last.s != 0)
      setState(() {
        rotateChart = (setupData.last.e.toDouble() * 360 / 1440);
      });
    // print(rotateChart);
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
            child: Text("S E T U P",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 20)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    radialValue = 0;
                    updateValues(0);
                  });
                },
                child: Icon(Icons.refresh)),
          )
        ],
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
                      PieChart(
                          PieChartData(startDegreeOffset: offset, sections: [
                        for (int i = 0; i < 24; i++)
                          PieChartSectionData(
                              value: 100 / 24,
                              color: Colors.black54,
                              title: "$i:00",
                              titleStyle: const TextStyle(fontSize: 12),
                              radius: 2,
                              titlePositionPercentageOffset: 10),
                      ])),
                      Transform.rotate(
                        angle: 263 * math.pi / 180,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              axisLineStyle: const AxisLineStyle(
                                  thickness: 6,
                                  color: Colors.black12,
                                  cornerStyle: CornerStyle.bothCurve),
                              minimum: 0,
                              maximum: 1440,
                              startAngle: 0,
                              endAngle: 360,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.6,
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: radialValue,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 6,
                                  sizeUnit: GaugeSizeUnit.logicalPixel,
                                  color: Colors.red,
                                ),
                                MarkerPointer(
                                  value: radialValue,
                                  enableDragging: true,
                                  onValueChanged: (value) {
                                    // print(finalData);
                                    // var rem = value % 60;
                                    int rem =
                                        roundToNearestFifteen(value.toInt());
                                    setState(() {
                                      HapticFeedback.heavyImpact();
                                      // Vibrate.defaultVibrationDuration;
                                      radialValue = rem.toDouble();
                                      updateValues(radialValue.toInt());
                                    });
                                  },
                                  markerHeight: 20,
                                  markerWidth: 20,
                                  markerType: MarkerType.circle,
                                  borderWidth: 2,
                                  borderColor: Colors.red,
                                )
                              ],
                              // annotations: [
                              //   GaugeAnnotation(
                              //     angle: 90,
                              //     axisValue: 5,
                              //     positionFactor: 0.1,
                              //     widget: Text(radialValue.ceil().toString()),
                              //   )
                              // ],
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Sleep"),
                            Text(data!.totalSleep.toString()),
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
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            radialValue = radialValue - 1;
                            updateValues(radialValue.toInt());
                            // Haptic Feedback
                          });
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          // print(radialValue);
                          setState(() {
                            radialValue = radialValue + 1;
                            updateValues(radialValue.toInt());
                            // Haptic Feedback
                          });
                        },
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < setupData.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 64),
                      child: Text(
                        "Sleep " + (i + 1).toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {}
                      // () => _selectTime(context, i, 's',
                      //     _timeOfDayConvert(finalData[i].s.toString())),
                      ,
                      child: NeuBox(
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
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {}

                      // () => _selectTime(context, i, 'e',
                      //     _timeOfDayConvert(finalData[i].e.toString()))
                      ,
                      child: NeuBox(
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
                    ),
                  ],
                ),
              ),
            // Container(
            //   child: ListView.builder(
            //       itemCount: value.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           leading: Icon(Icons.abc),
            //           trailing: Text("Harsh"),
            //           title: Text("Verma"),
            //         );
            //       }),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ActionSlider.standard(
            //     width: 300.0,
            //     action: (controller) async {
            //       controller.loading(); //starts loading animation
            //       await Future.delayed(const Duration(seconds: 1));
            //       _stopAlarm();
            //       controller.success(); //starts success animation
            //       await Future.delayed(const Duration(seconds: 1));
            //       controller.reset(); //resets the slider
            //     },
            //     direction: TextDirection.ltr,
            //     child: const Text('Stop Alarm #debug'),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ActionSlider.standard(
                toggleColor: Colors.redAccent,
                width: 300.0,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  // _setupAlarm();
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset(); //resets the slider
                  // additional sleep add
                  _saveData(SetupModel(
                      classification: data!.classification,
                      difficulty: data!.difficulty,
                      shortDesc: data!.shortDesc,
                      id: data!.id,
                      scheduleName: data!.scheduleName,
                      totalSleep: data!.totalSleep.toString(),
                      setup: convertToList(finalData),
                      svg: data!.svg));
                  // _saveAlarm(convertToList(finalData));
                  // Navigator.popUntil(context, ModalRoute.withName('/homepage'));

                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/homepage', ModalRoute.withName('/homepage'));
                  // Navigator.popUntil(
                  //   context,
                  //   ModalRoute.withName('/homepage'),
                  // );
                  // Navigator.popUntil(context, ModalRoute.withName('/homepage'));
                  // // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/homepage');
                  // Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/homepage', (Route<dynamic> route) => false);
                },
                direction: TextDirection.ltr,
                child: const Text('Setup Sleep Cycle'),
              ),
            ),
          ],
        ),
      ),
    );
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
        // print(list);
        // list[0] = list[0] + 1440 - value[i].s + value[i].e;
      }
    }
    // print(list);
    if (setupData.last.e > setupData.last.s) {
      list[0] = list[0] - 1440 + setupData.last.e;
    }
    if (setupData.last.e < setupData.last.s) {
      list[0] = list[0] + setupData.last.e;
    }

    // print(widget.id);
    // print(list);
    // print(finalData);
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
            title: list[i].toString(),
            showTitle: false));
      }
    }
    return sleep;
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
}

List<int> replace(List<int> list) {
  // print(list);
  if (list[1] < list[0]) {
    list.add(list[0]);
    list.add(list[1]);
    list.removeRange(0, 2);
  }
  // print(list);
  return list;
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
  List<bool> alarmData = [];
  for (var i = 0; i < data.setup.length / 2; i++) {
    alarmData.add(false);
  }
  var box = Hive.box('myBox');
  await box.put('id', data.id);
  await box.put('schedule_name', data.scheduleName);
  await box.put('setup', data.setup);
  await box.put('svg', data.svg);
  await box.put('total_sleep', data.totalSleep);
  await box.put('short_desc', data.shortDesc);
  await box.put('difficulty', data.difficulty);
  await box.put('alarm_data', alarmData);
  await box.put('reminder_data', alarmData);
  await box.put('classification', data.classification);
  await box.put('reminder_time', 0);

  // print(box.get('id'));
  // print(box.get('schedule_name'));
  // print(box.get('setup'));
  // print(box.get('svg'));
  // print(box.get('total_sleep'));
}

// void _saveAlarm(List<int> data) async {
//   var box = Hive.box('myAlarm');
//   await box.put('alarm_data', alarmData);
// }

void _stopAlarm() async {
  await Alarm.stop(1);
}

// void _setupAlarm() async {
//   await Alarm.set(
//       alarmSettings: AlarmSettings(
//           id: 1,
//           dateTime: DateTime.now(),
//           assetAudioPath: 'assets/alarm/alarm.mp3',
//           notificationTitle: 'This is the title',
//           notificationBody: 'This is the body'));
// }


// [
//   PieChartSectionData(
//     value: 360,
//     color: Colors.red,
//   ),
//   PieChartSectionData(
//       value: 480, color: Colors.black12),
//   PieChartSectionData(value: 20, color: Colors.red),
//   PieChartSectionData(
//       value: 580, color: Colors.black12),
// ]
