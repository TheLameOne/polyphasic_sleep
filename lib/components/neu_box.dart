import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final bool padding;
  const NeuBox({super.key, required this.child, this.padding = true});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(-4, -4)),
          ]),
      padding: (padding) ? const EdgeInsets.all(12) : const EdgeInsets.all(0),
      child: child,
    );
  }
}
