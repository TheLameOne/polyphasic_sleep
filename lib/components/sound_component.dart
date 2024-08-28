import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class SoundComponent extends StatelessWidget {
  const SoundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 16.0, right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/soundspage'),
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.1,
            width: (size.width - 48) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text("S O U N D S",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 18))),
            ),
          ),
        ),
      ),
    );
  }
}
