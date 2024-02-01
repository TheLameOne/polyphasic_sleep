import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    List<({int start, int end})> value = [
      (start: 120, end: 140),
      (start: 360, end: 380),
      (start: 600, end: 620),
      (start: 840, end: 860),
      (start: 1080, end: 1100),
      (start: 1320, end: 1410),
    ];
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PieChart(PieChartData(
                        startDegreeOffset: 263,
                        sectionsSpace: 0,
                        sections: _list(value))),
                  ),
                  PieChart(PieChartData(startDegreeOffset: 263, sections: [
                    for (int i = 0; i < 24; i++)
                      PieChartSectionData(
                          value: 100 / 24,
                          color: Colors.black54,
                          title: i.toString() + ":00",
                          titleStyle: TextStyle(fontSize: 12),
                          radius: 2,
                          titlePositionPercentageOffset: 10),
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> _list(List<({int start, int end})> v) {
  int temp = 0;
  int e = 0;
  int s = v[0].start;
  List<({int start, int end})> value = v;
  List<int> list = [];
  while (value.isNotEmpty) {
    if (value[0].start - value[0].end > 0) {
      temp = 1440 - value[0].start;
      list.add(value[0].end);
      e = value[0].end;
      value.removeAt(0);
    }
    if (e != value[0].start) {
      list.add((value[0].start - e) * -1);
      e = value[0].start;
    } else {
      list.add(value[0].end - value[0].start);
      e = value[0].end;
      value.removeAt(0);
    }
  }
  if (temp != 0) {
    list.add((s - e) * -1);
    list.add(temp);
  }
  return _sections(list);
}

List<PieChartSectionData> _sections(List<int> list) {
  List<PieChartSectionData> sleep = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > 0) {
      sleep.add(PieChartSectionData(
          value: list[i].toDouble(),
          color: Colors.red,
          title: list[i].toString()));
    } else {
      sleep.add(PieChartSectionData(
          value: list[i].abs().toDouble(),
          color: Colors.black12,
          showTitle: false));
    }
  }
  return sleep;
}

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