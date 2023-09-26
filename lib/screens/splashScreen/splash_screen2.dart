import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/TestScreen.dart';
import 'package:polyphasic_sleep/screens/home_screen.dart';
import 'package:polyphasic_sleep/screens/schedules/schedules.dart';

import '../how_it_works/how_it_works.dart';
import '../schedules/schedule_details.dart';

class SplashScreen2 extends StatefulWidget {
  static const String routeNamed = "SplashScreen2";

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[50],
      body: Container(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Reach your full potential by sleeping more than once each day.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
      ))),
    );
  }
}
