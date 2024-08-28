import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/pages/all_schedules_page.dart';

class AllScheduleComponent extends StatelessWidget {
  const AllScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16.0, right: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AllSchedulesPage()));
        },
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.1,
            width: (size.width - 48) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text("S C H E D U L E S",
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 18)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
