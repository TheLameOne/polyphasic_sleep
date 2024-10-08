import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/alarm_component.dart';
import 'package:polyphasic_sleep_new/components/all_schedule_component.dart';
import 'package:polyphasic_sleep_new/components/current_schedule_component.dart';
import 'package:polyphasic_sleep_new/components/how_it_works_component.dart';
import 'package:polyphasic_sleep_new/components/reminder_component.dart';
import 'package:polyphasic_sleep_new/components/settings_component.dart';
import 'package:polyphasic_sleep_new/components/sound_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool scheduleSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          toolbarHeight: size.height * 0.1,
          // elevation: 20,
          title: Center(
            child: Text("P O L Y P H A S I C      S L E E P",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
          )),
      // backgroundColor: Colors.amber,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CurrentScheduleComponent(),
            ),
            // SizedBox(height: size.height * 0.05),
            SizedBox(height: 32),
            Row(
              children: [
                Column(
                  children: [
                    // All Schedules
                    AllScheduleComponent(),

                    // How it Works
                    HowItWorksComponent(),

                    // Sleep Quality
                    RemindersComponent()
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    // Alarms
                    AlarmComponent(),

                    // Sounds
                    SoundComponent(),

                    // Settings
                    SettingsComponent(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
