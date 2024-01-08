import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:polyphasic_sleep/custom/schedule_type_box.dart';
import 'package:polyphasic_sleep/models/schedules_model.dart';

class SchedulesTypes extends StatefulWidget {
  List<ScheduleTypeModel> data;

  SchedulesTypes({required this.data});

  @override
  State<SchedulesTypes> createState() => _SchedulesTypesState();
}

class _SchedulesTypesState extends State<SchedulesTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Select Schedule Types",
            style: TextStyle(color: Colors.black),
          ),
          shadowColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Swiper(
            itemCount: widget.data.length,
            viewportFraction: 0.8,
            scale: 0.8,
            itemHeight: 400.0,
            itemBuilder: (context, index) {
              return Container(
                // height: 200,
                // width: 200,
                color: Colors.amber,
                child: Text(
                  widget.data[index].scheduleType.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
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
