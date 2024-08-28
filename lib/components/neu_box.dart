import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final bool padding;
  const NeuBox({super.key, required this.child, this.padding = true});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context).currentThemeIndex == 1;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSecondary,
                blurRadius: 10,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.secondary,
                blurRadius: 10,
                offset: const Offset(-4, -4)),
          ]),
      padding: (padding) ? const EdgeInsets.all(12) : const EdgeInsets.all(0),
      child: child,
    );
  }
}
