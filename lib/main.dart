import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polyphasic_sleep/screens/alarm_screen/alarm_screen.dart';
import 'package:polyphasic_sleep/screens/all_schedules/all_schedules_screen.dart';
import 'package:polyphasic_sleep/screens/current_schedule/current_schedule_screen.dart';
import 'package:polyphasic_sleep/screens/home_screen.dart';
import 'package:polyphasic_sleep/screens/how_it_works_screen/how_it_works.dart';
import 'package:polyphasic_sleep/screens/all_schedules/schedules.dart';
import 'package:polyphasic_sleep/screens/current_schedule/sleep.dart';
import 'package:polyphasic_sleep/screens/sleep_quality_scren/sleep_quality_screen.dart';
import 'package:polyphasic_sleep/screens/sound_screen/sound_screen.dart';
import 'package:polyphasic_sleep/screens/splashScreen/splash_screen.dart';
import 'package:polyphasic_sleep/screens/splashScreen/splash_screen2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init(showDebugLogs: true);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(26, 33, 48, 1),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Color.fromRGBO(26, 33, 48, 1),
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color.fromRGBO(26, 33, 48, 1)));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Polyphasic Sleep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: SplashScreen.routeNamed,
      routes: {
        // LoginScreen.routeNamed: (BuildContext context) => LoginScreen(),
        SplashScreen.routeNamed: (BuildContext context) => SplashScreen(),
        HomeScreen.routeNamed: (BuildContext context) => HomeScreen(),
        // Home Page Screens
        // CurrentScheduleScreen.routeNamed: (BuildContext context) =>
        //     CurrentScheduleScreen(),
        AllSchedulesScreen.routeNamed: (BuildContext context) =>
            AllSchedulesScreen(),
        SleepQualityScreen.routeNamed: (BuildContext context) =>
            SleepQualityScreen(),
        AlarmScreen.routeNamed: (BuildContext context) => AlarmScreen(),
        HowItWorks.routeNamed: (BuildContext context) => HowItWorks(),
        SoundScreen.routeNamed: (BuildContext context) => SoundScreen(),
        Sleep.routeNamed: (BuildContext context) => Sleep(),
      },
    );
  }
}
