import 'package:flutter/material.dart';
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (int i = 0; i < widget.data.length; i++)
                Schedule_type_box(
                    scheduleType: widget.data[i].scheduleType!,
                    duration: widget.data[i].duration!,
                    classification: widget.data[i].classification!,
                    specification: widget.data[i].specification!,
                    mechanism: widget.data[i].mechanism!,
                    adaptationDifficulty: widget.data[i].adaptationDifficulty!,
                    idealScheduling: widget.data[i].idealScheduling!,
                    link: widget.data[i].link!)
            ],
          ),
        ),
      )),
    );
  }
}
