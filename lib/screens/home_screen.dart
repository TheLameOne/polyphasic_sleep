import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/screens/all_schedules/all_schedules_screen.dart';
import 'package:polyphasic_sleep/screens/how_it_works_screen/how_it_works.dart';
import 'package:polyphasic_sleep/screens/all_schedules/schedules.dart';
import 'package:polyphasic_sleep/screens/current_schedule/sleep.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "Polyphasic Sleep",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Main Container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(191, 215, 221, 1),
                      borderRadius: BorderRadius.circular(30)),
                  height: 200,
                  width: size.width - 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Translate \nEverything",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Sleep.routeNamed);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(45, 44, 45, 1),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 8, bottom: 8),
                                    child: Text(
                                      "Start",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.red,
                          child: Text("Image"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              // Semi Container
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AllSchedulesScreen.routeNamed);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 163, 163, 1),
                            borderRadius: BorderRadius.circular(30)),
                        height: 100,
                        width: (size.width - 32) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Schedules",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(167, 206, 180, 1),
                          // const Color.fromRGBO(236, 163, 163, 1),
                          borderRadius: BorderRadius.circular(30)),
                      height: 100,
                      width: (size.width - 32) / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            "Sounds",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HowItWorks.routeNamed);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(236, 163, 163, 1),
                        borderRadius: BorderRadius.circular(30)),
                    height: 100,
                    width: (size.width),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          "How it Works",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
