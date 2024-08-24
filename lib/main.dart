import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polyphasic_sleep_new/models/sound_provider.dart';
import 'package:polyphasic_sleep_new/pages/alarm_page.dart';
import 'package:polyphasic_sleep_new/pages/all_schedules_page.dart';
import 'package:polyphasic_sleep_new/pages/current_schedule_page.dart';
import 'package:polyphasic_sleep_new/pages/edit_schedule.dart';
import 'package:polyphasic_sleep_new/pages/home_page.dart';
import 'package:polyphasic_sleep_new/pages/how_it_works_page.dart';
import 'package:polyphasic_sleep_new/pages/reminders_page.dart';
import 'package:polyphasic_sleep_new/pages/settings_page.dart';
import 'package:polyphasic_sleep_new/pages/sleep_quality_page.dart';
import 'package:polyphasic_sleep_new/pages/sound_playback_page.dart';
import 'package:polyphasic_sleep_new/pages/sounds_page.dart';
import 'package:polyphasic_sleep_new/pages/splash_screen/logo_page.dart';
import 'package:polyphasic_sleep_new/pages/splash_screen/quote_page.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:polyphasic_sleep_new/util/local_notifications.dart';
import 'package:provider/provider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  await Alarm.init();
  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (initialNotification?.didNotificationLaunchApp == true) {
    // LocalNotifications.onClickNotification.stream.listen((event) {
    Future.delayed(Duration(seconds: 1), () {
      print("Main Screen Error");
      // navigatorKey.currentState!.pushNamed('/another',
      //     arguments: initialNotification?.notificationResponse?.payload);
    });
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SoundProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polyphasic Sleep',
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => const HomePage(),
        '/currentschedulepage': (context) => const CurrentSchedulePage(),
        '/allschedulespage': (context) => const AllSchedulesPage(),
        '/alarmpage': (context) => const AlarmPage(),
        '/howitworkspage': (context) => const HowItWorksPage(),
        '/soundspage': (context) => const SoundsPage(),
        '/sleepqualitypage': (context) => const SleepQualityPage(),
        '/reminderspage': (context) => const RemindersPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/logopage': (context) => const LogoPage(),
        '/quotepage': (context) => const QuotePage(),
        '/editschedule': (context) => const EditSchedule(),
        // '/setuppage': (context) => const SetupPage(),
        '/soundplaybackpage': (context) => const SoundPlaybackPage()
      },
    );
  }
}
