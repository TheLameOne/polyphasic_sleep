import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:polyphasic_sleep/custom/schedule_type_box.dart';
import 'package:polyphasic_sleep/models/schedules_model.dart';
import 'package:polyphasic_sleep/screens/current_schedule/setup.dart';

class CurrentScheduleScreen extends StatefulWidget {
  static const String routeNamed = "CurrentScheduleScreen";
  List<ScheduleTypeModel> data;
  CurrentScheduleScreen({required this.data});

  @override
  State<CurrentScheduleScreen> createState() => _CurrentScheduleScreenState();
}

class _CurrentScheduleScreenState extends State<CurrentScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(191, 215, 221, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "Select Schedule Types",
              style: TextStyle(color: Colors.black),
            ),
          ),
          shadowColor: Color.fromRGBO(191, 215, 221, 1),
          elevation: 0,
          backgroundColor: Color.fromRGBO(191, 215, 221, 1),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
              child: Swiper(
                itemCount: widget.data.length,
                viewportFraction: 0.8,
                scale: 0.8,
                itemHeight: 400.0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetupScreen()));
                    },
                    child: Container(
                      // height: 200,
                      // width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.data[index].scheduleType.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
        // SafeArea(
        //     child: SingleChildScrollView(
        //   child: Container(
        //     child: Column(
        //       children: [
        //         for (int i = 0; i < widget.data.length; i++)
        //           Schedule_type_box(
        //               scheduleType: widget.data[i].scheduleType!,
        //               duration: widget.data[i].duration!,
        //               classification: widget.data[i].classification!,
        //               specification: widget.data[i].specification!,
        //               mechanism: widget.data[i].mechanism!,
        //               adaptationDifficulty: widget.data[i].adaptationDifficulty!,
        //               idealScheduling: widget.data[i].idealScheduling!,
        //               link: widget.data[i].link!)
        //       ],
        //     ),
        //   ),
        // )),
        );
  }
}
