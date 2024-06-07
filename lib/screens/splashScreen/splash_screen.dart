import 'dart:async';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/TestScreen.dart';
import 'package:polyphasic_sleep/screens/splashScreen/splash_screen2.dart';

class SplashScreen extends StatefulWidget {
  static const String routeNamed = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen2(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[50],
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/polylogo.png")),
          SizedBox(height: 32),
          Text(
            "POLYPHASIC SLEEP",
            style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          )
        ],
      ))),
    );
  }
}
