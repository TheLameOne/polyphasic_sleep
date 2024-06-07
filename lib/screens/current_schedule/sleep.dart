import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/models/schedules_model.dart';
import 'package:polyphasic_sleep/screens/current_schedule/current_schedule_screen.dart';
import '../../custom/Schedule_box.dart';
import '../../utils/global.dart';
import 'package:flutter/services.dart' as rootbundle;

class Sleep extends StatefulWidget {
  static const String routeNamed = "Sleep";

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    if (schedule) {
      return const Scaffold();
    } else {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var schedules = data.data as List<ScheduleModel>;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Column(
                        children: [
                          // Select sleep schedules
                          const Text("Sleep Schedules",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32),
                          // Schedules
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < schedules.length; i++)
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CurrentScheduleScreen(
                                                    data:
                                                        schedules[i].types!)));
                                  },
                                  child: Schedule_box(
                                      name:
                                          schedules[i].scheduleName!.toString(),
                                      link: schedules[i]
                                          .scheduleName!
                                          .toString()),
                                ),
                            ],
                          )
                        ],
                      )),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      );
    }
  }
}

Future<List<ScheduleModel>> readJsonData() async {
  final jsondata =
      await rootbundle.rootBundle.loadString('json/schedules.json');
  // print(jsondata);
  final list = json.decode(jsondata) as List<dynamic>;
  List<ScheduleModel> res = [];
  for (var item in list) {
    res.add(ScheduleModel.fromJson(item));
  }
  return res;
  // return list.map((e) => DataModel.fromJson(e)).toList();
}
