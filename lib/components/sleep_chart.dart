import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polyphasic_sleep_new/models/setup_model.dart';
import 'package:polyphasic_sleep_new/pages/edit_schedule.dart';

class SleepChart extends StatefulWidget {
  final int id;
  final double centerSpaceRadius;
  final double thickness;
  const SleepChart(
      {super.key,
      required this.id,
      this.centerSpaceRadius = 40,
      this.thickness = 28});

  @override
  State<SleepChart> createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart> {
  double offset = 263;
  double rotateChart = 263;
  SetupModel? data;
  List<({int s, int e})> setupData = [];
  List<({int s, int e})> finalData = [];

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

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    data = await fetchData(widget.id);
    if (data != null) {
      setupData = convertToTuple(replace(data!.setup));
      finalData = [...setupData];
      setState(() {});
    } else {
      // print('No data found for id ${widget.id}');
    }
    if (setupData.last.s != 0) {
      setState(() {
        rotateChart = (setupData.last.e.toDouble() * 360 / 1440);
      });
    }
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
