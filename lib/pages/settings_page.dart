import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
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
                value: _getCurrentThemeIndex(context) == 1,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme()),
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
                            color: Colors.grey,
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 2),
                    child: Center(
                      child: Container(
                        height: (_getCurrentThemeIndex(context) == 2) ? 30 : 20,
                        width: (_getCurrentThemeIndex(context) == 2) ? 30 : 20,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 3),
                    child: Container(
                      height: (_getCurrentThemeIndex(context) == 3) ? 30 : 20,
                      width: (_getCurrentThemeIndex(context) == 3) ? 30 : 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                InkWell(
                    onTap: () => _setTheme(context, 4),
                    child: Container(
                      height: (_getCurrentThemeIndex(context) == 4) ? 30 : 20,
                      width: (_getCurrentThemeIndex(context) == 4) ? 30 : 20,
                      decoration: BoxDecoration(
                          color: Colors.green,
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
