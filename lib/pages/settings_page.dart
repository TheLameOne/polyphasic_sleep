import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/brick_dark.dart';
import 'package:polyphasic_sleep_new/theme/burnt_umber_dark.dart';
import 'package:polyphasic_sleep_new/theme/cocoa_dark.dart';
import 'package:polyphasic_sleep_new/theme/copper_sand_light.dart';
import 'package:polyphasic_sleep_new/theme/ebony_dark.dart';
import 'package:polyphasic_sleep_new/theme/mocha_dark.dart';
import 'package:polyphasic_sleep_new/theme/muted_desert_light.dart';
import 'package:polyphasic_sleep_new/theme/rustic_beige_light.dart';
import 'package:polyphasic_sleep_new/theme/terracotta_light.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:polyphasic_sleep_new/theme/warm_earth_light.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("S E T T I N G S",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          ListTile(
            title: const Text("Dark Mode"),
            trailing: Switch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleDarkMode()),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => _setTheme(context, 0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: (_getDarkMode(context))
                                ? copperSandLight.primaryColor
                                : brickDark.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: (_getCurrentThemeIndex(context) == 0) ? 30 : 20,
                        width:
                            (_getCurrentThemeIndex(context) == 0) ? 30 : 20)),
                InkWell(
                    onTap: () => _setTheme(context, 1),
                    child: Container(
                      height: (_getCurrentThemeIndex(context) == 1) ? 30 : 20,
                      width: (_getCurrentThemeIndex(context) == 1) ? 30 : 20,
                      decoration: BoxDecoration(
                          color: (_getDarkMode(context))
                              ? burntUmberDark.primaryColor
                              : mutedDesertLight.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 2),
                    child: Center(
                      child: Container(
                        height: (_getCurrentThemeIndex(context) == 2) ? 30 : 20,
                        width: (_getCurrentThemeIndex(context) == 2) ? 30 : 20,
                        decoration: BoxDecoration(
                            color: (_getDarkMode(context))
                                ? cocoaDark.primaryColor
                                : rusticBeigeLight.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 3),
                    child: Container(
                      height: (_getCurrentThemeIndex(context) == 3) ? 30 : 20,
                      width: (_getCurrentThemeIndex(context) == 3) ? 30 : 20,
                      decoration: BoxDecoration(
                          color: (_getDarkMode(context))
                              ? ebonyDark.primaryColor
                              : terracottaLight.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 4),
                    child: Container(
                      height: (_getCurrentThemeIndex(context) == 4) ? 30 : 20,
                      width: (_getCurrentThemeIndex(context) == 4) ? 30 : 20,
                      decoration: BoxDecoration(
                          color: (_getDarkMode(context))
                              ? mochaDark.primaryColor
                              : warmEarthLight.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

_setTheme(context, int i) {
  return Provider.of<ThemeProvider>(context, listen: false).setTheme(i);
}

_getCurrentThemeIndex(context) {
  return Provider.of<ThemeProvider>(context, listen: false).currentThemeIndex;
}

_getDarkMode(context) {
  return Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
}
