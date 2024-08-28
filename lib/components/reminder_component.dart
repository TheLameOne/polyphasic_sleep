import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class RemindersComponent extends StatelessWidget {
  const RemindersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16.0, right: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/reminderspage'),
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.15,
            width: (size.width - 48) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("R E M I N D E R S",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                fontSize: 18)),
                      ],
                    ),
                    // const SizedBox(height: 16),
                    // Icon(Icons.circle_outlined,
                    //     size: 40,
                    //     color: Theme.of(context).colorScheme.inversePrimary)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
