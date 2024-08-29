import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
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
  final Color color;
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
                  _convertName(widget.scheduleType),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 28),
                ),
                InkWell(
                    onTap: () {
                      _launchURL(widget.link);
                    },
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Details
                SizedBox(
                  width: size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.shortDescription,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12),
                      ),
                      Text(
                        widget.totalSleep,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12),
                      ),
                      Text(
                        widget.classification,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12),
                      ),
                      Text(
                        widget.difficulty.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12),
                      ),
                      Text(
                        widget.idealScheduling,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
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
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.surface,
                ),
                toggleColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.surface,
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
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(url) async {
  final Uri urlParsed = Uri.parse(url);
  if (!await launchUrl(urlParsed)) {
    throw Exception('Could not launch $url');
  }
}

String _convertName(String name) {
  String newName = "";
  for (int i = 0; i < name.length; i++) {
    newName += name[i].toUpperCase();
    if (i != name.length - 1) {
      newName += " ";
    }
  }
  return newName;
}
