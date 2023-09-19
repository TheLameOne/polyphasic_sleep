import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: SplashScreen.routeNamed,
      routes: {
        // LoginScreen.routeNamed: (BuildContext context) => LoginScreen(),
        SplashScreen.routeNamed: (BuildContext context) => SplashScreen(),
        // HomeScreen.routeNamed: (BuildContext context) => HomeScreen(),
        // PackageOverviewScreen.routeNamed: (BuildContext context) =>
        //     PackageOverviewScreen(),
        // // CheckoutScreen.routeNamed: (BuildContext context) => CheckoutScreen(),
        // BookingScreen.routeNamed: (BuildContext context) => BookingScreen(),
        // ProfileScreen.routeNamed: (BuildContext context) => ProfileScreen(),
        // ReferScreen.routeNamed: (BuildContext context) => ReferScreen(),
        // FavouriteScreen.routeNamed: (BuildContext context) => FavouriteScreen(),
        // PackagesScreen.routeNamed: (BuildContext context) => PackagesScreen(),
      },
    );
  }
}
