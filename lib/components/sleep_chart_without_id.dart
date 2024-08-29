import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/models/setup_model.dart';

class SleepChartWithoutId extends StatefulWidget {
  final List<dynamic> setup;
  final double centerSpaceRadius;
  final double thickness;
  const SleepChartWithoutId(
      {super.key,
      required this.setup,
      this.centerSpaceRadius = 40,
      this.thickness = 28});

  @override
  State<SleepChartWithoutId> createState() => _SleepChartWithoutIdState();
}

class _SleepChartWithoutIdState extends State<SleepChartWithoutId> {
  double offset = 263;
  double rotateChart = 263;
  SetupModel? data;

  List<({int s, int e})> setupData = [];
  List<({int s, int e})> finalData = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    setupData = convertToTuple(widget.setup);
    finalData = [...setupData];
    if (setupData.last.s != 0) {
      setState(() {
        rotateChart = (setupData.last.e.toDouble() * 360 / 1440);
      });
    }
  }

  List<({int s, int e})> convertToTuple(List<dynamic> dataBefore) {
    List<({int s, int e})> result = [];
    for (int i = 0; i < dataBefore.length; i += 2) {
      result.add((s: dataBefore[i], e: dataBefore[i + 1]));
    }
    result.sort((a, b) => a.s.compareTo(b.s));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        centerSpaceRadius: widget.centerSpaceRadius,
        startDegreeOffset: offset + rotateChart,
        sectionsSpace: 0,
        sections: _list(setupData)));
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
            radius: widget.thickness,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200),
            value: list[i].toDouble(),
            color: Theme.of(context).colorScheme.tertiary,
            title: list[i].toString(),
            showTitle: false));
      } else {
        sleep.add(PieChartSectionData(
            radius: widget.thickness,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200),
            value: list[i].abs().toDouble(),
            color: Colors.black26,
            title: list[i].toString(),
            showTitle: false));
      }
    }
    return sleep;
  }
}
