import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polyphasic_sleep/screens/home_screen.dart';
import 'package:polyphasic_sleep/screens/how_it_works/how_it_works.dart';
import 'package:polyphasic_sleep/screens/schedules/schedules.dart';
import 'package:polyphasic_sleep/screens/splashScreen/splash_screen.dart';
import 'package:polyphasic_sleep/screens/splashScreen/splash_screen2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        Schedules.routeNamed: (BuildContext context) => Schedules(),
        HowItWorks.routeNamed: (BuildContext context) => HowItWorks(),
      },
    );
  }
}
