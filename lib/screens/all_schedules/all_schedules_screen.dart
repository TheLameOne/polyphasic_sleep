import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';

class AllSchedulesScreen extends StatelessWidget {
  static const String routeNamed = "AllSchedulesScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              // Title
              Text(
                "BIPHASIC",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              // Info
              Text(
                "Biphasic sleep schedules have been prevalent through time. In a way or another, humans tend to sleep twice a day. There are two types of biphasic patterns; one has a daytime nap of some sort, while the other has 2 concentrated sleep blocks at night. Moreover, there are documents on a lot of famous biphasic sleepers in the modern era. ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              // Animation
              AnimatedCircularChart(
                size: Size(300.0, 300.0),
                initialChartData: <CircularStackEntry>[
                  new CircularStackEntry(
                    <CircularSegmentEntry>[
                      new CircularSegmentEntry(
                        10.0,
                        Colors.blue[400],
                        rankKey: 'completed',
                      ),
                      new CircularSegmentEntry(
                        66.67,
                        Colors.blueGrey[600],
                        rankKey: 'remaining',
                      ),
                    ],
                    rankKey: 'progress',
                  ),
                ],
                chartType: CircularChartType.Radial,
                edgeStyle: SegmentEdgeStyle.round,
                percentageValues: true,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
