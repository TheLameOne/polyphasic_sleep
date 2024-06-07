import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/utils/styles.dart';

class Schedule_box extends StatelessWidget {
  final String name;
  final String link;

  Schedule_box({required this.name, required this.link});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<({int s, int e})> value = [
      (s: 120, e: 140),
      (s: 360, e: 380),
      (s: 600, e: 620),
      (s: 840, e: 860),
      (s: 1080, e: 1100),
      (s: 1320, e: 1410),
    ];
    return Card(
      color: Styles.color3,
      elevation: 0,
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.black),
        //     borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Text(
                    "5-6.5 hrs of Sleep",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.2,
                child: PieChart(PieChartData(
                    startDegreeOffset: 263,
                    sectionsSpace: 0,
                    sections: _list(value))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> _list(List<({int s, int e})> v) {
  int temp = 0;
  int e = 0;
  int s = v[0].s;
  List<({int s, int e})> value = v;
  List<int> list = [];
  while (value.isNotEmpty) {
    if (value[0].s - value[0].e > 0) {
      temp = 1440 - value[0].s;
      list.add(value[0].e);
      e = value[0].e;
      value.removeAt(0);
    }
    if (e != value[0].s) {
      list.add((value[0].s - e) * -1);
      e = value[0].s;
    } else {
      list.add(value[0].e - value[0].s);
      e = value[0].e;
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
          color: Styles.color3,
          showTitle: false,
          title: list[i].toString()));
    } else {
      sleep.add(PieChartSectionData(
          value: list[i].abs().toDouble(),
          color: Styles.color2,
          showTitle: false));
    }
  }
  return sleep;
}
