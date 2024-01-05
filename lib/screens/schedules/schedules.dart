import 'package:flutter/material.dart';

import '../../custom/Schedule_box.dart';
import '../../utils/styles.dart';

class Schedules extends StatefulWidget {
  static const String routeNamed = "Schedules";

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                // Select sleep schedules
                Text("Select Sleep Schedules",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 32),
                // Schedules
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Schedule_box(), Schedule_box()],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Schedule_box(), Schedule_box()],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Schedule_box(), Schedule_box()],
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
