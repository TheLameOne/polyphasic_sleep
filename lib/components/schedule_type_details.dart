import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:polyphasic_sleep_new/components/sleep_chart.dart';
import 'package:polyphasic_sleep_new/components/sleep_chart_without_id.dart';
import 'package:polyphasic_sleep_new/pages/setup_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleTypeDetails extends StatefulWidget {
  final String scheduleType;
  final String shortDescription;
  final String totalSleep;
  final String classification;
  final double difficulty;
  final String link;
  final String idealScheduling;
  final String svgPath;
  final HexColor color;
  final int id;
  final List<dynamic> setup;

  const ScheduleTypeDetails(
      {super.key,
      required this.scheduleType,
      required this.shortDescription,
      required this.totalSleep,
      required this.classification,
      required this.difficulty,
      required this.idealScheduling,
      required this.link,
      required this.svgPath,
      required this.color,
      required this.id,
      required this.setup});

  @override
  State<ScheduleTypeDetails> createState() => _ScheduleTypeDetailsState();
}

class _ScheduleTypeDetailsState extends State<ScheduleTypeDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.scheduleType,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 32),
                ),
                InkWell(
                    onTap: () {
                      _launchURL(widget.link);
                    },
                    child: Icon(Icons.info_outline_rounded))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Details
                Container(
                  width: size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.shortDescription,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                      Text(
                        widget.totalSleep,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                      Text(
                        widget.classification,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                      Text(
                        widget.difficulty.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                      Text(
                        widget.idealScheduling,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // PNG
                SizedBox(
                    // color: Theme.of(context).colorScheme.surface,
                    height: size.height * 0.3,
                    width: size.width * 0.3,
                    child: SleepChartWithoutId(
                      setup: widget.setup,
                    )
                    // SvgPicture.asset("assets/svg/light/$svgPath.svg",
                    //     semanticsLabel: 'Acme Logo'),
                    // PieChart(PieChartData(
                    //     centerSpaceRadius: 40,
                    //     startDegreeOffset: 263,
                    //     sectionsSpace: 0,
                    //     sections: _list(value))
                    //     ),
                    )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ActionSlider.standard(
                toggleColor: Colors.redAccent,
                width: 250.0,
                height: 50,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(milliseconds: 200));
                  // _setupAlarm();
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(milliseconds: 200));
                  controller.reset(); //resets the slider
                  // _saveData(saveData);
                  // Notifier will come here
                  if (mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupPage(
                                  id: widget.id,
                                )));
                  }
                },
                direction: TextDirection.ltr,
                child: const Text('Select Schedule'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(_url) async {
  final Uri url = Uri.parse(_url);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $_url');
  }
}
