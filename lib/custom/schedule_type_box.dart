import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';

class Schedule_type_box extends StatelessWidget {
  final String scheduleType;
  final String duration;
  final String classification;
  final String specification;
  final String mechanism;
  final String adaptationDifficulty;
  final String idealScheduling;
  final String link;

  Schedule_type_box(
      {required this.scheduleType,
      required this.duration,
      required this.classification,
      required this.specification,
      required this.mechanism,
      required this.adaptationDifficulty,
      required this.idealScheduling,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(scheduleType),
            Text(duration),
            Text(specification),
            Text(mechanism),
            Text(adaptationDifficulty),
            Text(idealScheduling),
            Text(link),
            SizedBox(height: 16),
            // Render
          ],
        ),
      ),
    );
  }
}
