import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:polyphasic_sleep_new/util/global.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("S E T T I N G S",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Appearance",
              //   style: TextStyle(
              //       color: Theme.of(context).colorScheme.onSurface,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 32),
              // ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // color
                            Text(
                              "Color",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            ),
                            // orange
                            Text(
                                Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .getThemeName()[
                                        _getCurrentThemeIndex(context)]
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer))
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // colors
                            for (int i = 0;
                                i <
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .getThemeList()
                                        .length;
                                i++)
                              GestureDetector(
                                onTap: () => _setTheme(context, i),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: _getCurrentThemeIndex(context) == i
                                        ? Border.all(
                                            width: 4,
                                            color: (Provider.of<ThemeProvider>(
                                                        context,
                                                        listen: false)
                                                    .isDarkMode)
                                                ? Colors.white
                                                : Provider.of<ThemeProvider>(
                                                        context,
                                                        listen: false)
                                                    .getThemeList()[i]
                                                    .colorScheme
                                                    .primary)
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                    color: Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .getDarkThemeList()[i]
                                        .colorScheme
                                        .primary,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Theme",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            ),
                            const SizedBox(),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                // PIC light Mode
                                NeuBox(
                                  padding: false,
                                  child: Container(
                                    height: 160,
                                    child: Image.asset(
                                        'assets/images/android_light.png'),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Light",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                ),
                                Radio<int>(
                                  value: 1,
                                  groupValue: modes,
                                  onChanged: (v) {
                                    setState(() {
                                      modes = v!;
                                    });
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .setLightMode();
                                  },
                                ),
                                // Radio Button
                              ],
                            ),
                            Column(
                              children: [
                                // PIC light Mode
                                NeuBox(
                                  padding: false,
                                  child: Container(
                                    height: 160,
                                    child: Image.asset(
                                        'assets/images/android_dark.png'),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Dark",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                ),
                                Radio<int>(
                                  value: 2,
                                  groupValue: modes,
                                  onChanged: (v) {
                                    setState(() {
                                      modes = v!;
                                    });
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .setDarkMode();
                                  },
                                ),
                                // Radio Button
                              ],
                            ),
                            Column(
                              children: [
                                // PIC light Mode
                                NeuBox(
                                  padding: false,
                                  child: Container(
                                    height: 160,
                                    child: Image.asset(
                                        'assets/images/android_system.png'),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "System",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                ),
                                Radio<int>(
                                  value: 3,
                                  groupValue: modes,
                                  onChanged: (v) {
                                    setState(() {
                                      modes = v!;
                                    });
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .setSystemDefaultMode(systemBrightness);
                                  },
                                ),
                                // Radio Button
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // ListTile(
              //   title: Text(
              //     "Dark Mode",
              //     style: TextStyle(
              //       color: Theme.of(context).colorScheme.onSurface,
              //     ),
              //   ),
              //   trailing: Switch(
              //       activeColor: Theme.of(context).colorScheme.primary,
              //       inactiveTrackColor: Theme.of(context).colorScheme.onPrimary,
              //       inactiveThumbColor: Theme.of(context).colorScheme.primary,
              //       value: Provider.of<ThemeProvider>(context, listen: false)
              //           .isDarkMode,
              //       onChanged: (value) =>
              //           Provider.of<ThemeProvider>(context, listen: false)
              //               .toggleDarkMode()),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //           onTap: () => _setTheme(context, 0),
              //           child: Container(
              //               decoration: BoxDecoration(
              //                   color: (_getDarkMode(context))
              //                       ? blueDark.colorScheme.primary
              //                       : blueDark.colorScheme.primary,
              //                   borderRadius: BorderRadius.circular(5)),
              //               height:
              //                   (_getCurrentThemeIndex(context) == 0) ? 40 : 30,
              //               width: (_getCurrentThemeIndex(context) == 0)
              //                   ? 40
              //                   : 30)),
              //       InkWell(
              //           onTap: () => _setTheme(context, 1),
              //           child: Container(
              //             height:
              //                 (_getCurrentThemeIndex(context) == 1) ? 40 : 30,
              //             width:
              //                 (_getCurrentThemeIndex(context) == 1) ? 40 : 30,
              //             decoration: BoxDecoration(
              //                 color: (_getDarkMode(context))
              //                     ? greenDark.colorScheme.primary
              //                     : greenDark.colorScheme.primary,
              //                 borderRadius: BorderRadius.circular(5)),
              //           )),
              //       InkWell(
              //           onTap: () => _setTheme(context, 2),
              //           child: Center(
              //             child: Container(
              //               height:
              //                   (_getCurrentThemeIndex(context) == 2) ? 40 : 30,
              //               width:
              //                   (_getCurrentThemeIndex(context) == 2) ? 40 : 30,
              //               decoration: BoxDecoration(
              //                   color: (_getDarkMode(context))
              //                       ? orangeDark.colorScheme.primary
              //                       : orangeDark.colorScheme.primary,
              //                   borderRadius: BorderRadius.circular(5)),
              //             ),
              //           )),
              //       InkWell(
              //           onTap: () => _setTheme(context, 3),
              //           child: Container(
              //             height:
              //                 (_getCurrentThemeIndex(context) == 3) ? 40 : 30,
              //             width:
              //                 (_getCurrentThemeIndex(context) == 3) ? 40 : 30,
              //             decoration: BoxDecoration(
              //                 color: (_getDarkMode(context))
              //                     ? yellowDark.colorScheme.primary
              //                     : yellowDark.colorScheme.primary,
              //                 borderRadius: BorderRadius.circular(5)),
              //           )),
              //       InkWell(
              //           onTap: () => _setTheme(context, 4),
              //           child: Container(
              //             height:
              //                 (_getCurrentThemeIndex(context) == 4) ? 40 : 30,
              //             width:
              //                 (_getCurrentThemeIndex(context) == 4) ? 40 : 30,
              //             decoration: BoxDecoration(
              //                 color: (_getDarkMode(context))
              //                     ? light.colorScheme.primary
              //                     : dark.colorScheme.primary,
              //                 borderRadius: BorderRadius.circular(5)),
              //           ))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

_setTheme(context, int i) {
  return Provider.of<ThemeProvider>(context, listen: false).setTheme(i);
}

int _getCurrentThemeIndex(context) {
  return Provider.of<ThemeProvider>(context, listen: false).currentThemeIndex;
}

_getDarkMode(context) {
  return Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
}
