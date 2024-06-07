import 'package:flutter/material.dart';
import 'package:polyphasic_sleep/screens/all_schedules/all_schedules_screen.dart';
import 'package:polyphasic_sleep/screens/how_it_works_screen/how_it_works.dart';
import 'package:polyphasic_sleep/screens/all_schedules/schedules.dart';
import 'package:polyphasic_sleep/screens/current_schedule/sleep.dart';
import 'package:polyphasic_sleep/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.backgroundColor,
        body: CustomScrollView(
          controller: _scrollViewController,
          slivers: [
            SliverAppBar(
              expandedHeight: size.height * 0.15,
              backgroundColor: Styles.backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  child: Text(
                    "Polyphasic\nSleep",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(191, 215, 221, 1),
                    borderRadius: BorderRadius.circular(30)),
                height: size.height * 0.2,
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
                              "Everyman 1",
                              style: TextStyle(
                                  color: Styles.backgroundColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Sleep.routeNamed);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Styles.backgroundColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Text(
                                    "Setup",
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
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AllSchedulesScreen.routeNamed);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Styles.color3,
                              borderRadius: BorderRadius.circular(30)),
                          height: size.height * 0.1,
                          width: (size.width - 32) / 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                "All Schedules",
                                style: TextStyle(
                                    color: Styles.backgroundColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.color2,
                            borderRadius: BorderRadius.circular(30)),
                        height: size.height * 0.1,
                        width: (size.width - 32) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "How it Works?",
                              style: TextStyle(
                                  color: Styles.backgroundColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.color2,
                            borderRadius: BorderRadius.circular(30)),
                        height: size.height * 0.1,
                        width: (size.width - 32) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Sleep Quality",
                              style: TextStyle(
                                  color: Styles.backgroundColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.color1,
                            borderRadius: BorderRadius.circular(30)),
                        height: size.height * 0.1,
                        width: (size.width - 32) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Alarms",
                              style: TextStyle(
                                  color: Styles.backgroundColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.color3,
                            borderRadius: BorderRadius.circular(30)),
                        height: size.height * 0.1,
                        width: (size.width - 32) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "Sounds",
                              style: TextStyle(
                                  color: Styles.backgroundColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
          // child: Column(
          //   children: [
          //     //Heading
          //     // Main Container
          //     Container(
          //       decoration: BoxDecoration(
          //           color: Color.fromRGBO(191, 215, 221, 1),
          //           borderRadius: BorderRadius.circular(30)),
          //       height: size.height * 0.2,
          //       width: size.width - 16,
          //       child: Padding(
          //         padding: const EdgeInsets.all(16.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     "Everyman 1",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 32,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //                       Navigator.pushNamed(context, Sleep.routeNamed);
          //                     },
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                           color: Color.fromRGBO(45, 44, 45, 1),
          //                           borderRadius: BorderRadius.circular(30)),
          //                       child: Padding(
          //                         padding: const EdgeInsets.only(
          //                             left: 20, right: 20, top: 8, bottom: 8),
          //                         child: Text(
          //                           "Setup",
          //                           style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 22,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               color: Colors.red,
          //               child: Text("Image"),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 4),
          //     // Semi Container
          //     Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 8.0),
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.pushNamed(
          //                   context, AllSchedulesScreen.routeNamed);
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                   color: const Color.fromRGBO(236, 163, 163, 1),
          //                   borderRadius: BorderRadius.circular(30)),
          //               height: 100,
          //               width: (size.width - 32) / 2,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Center(
          //                   child: Text(
          //                     "Schedules",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 22,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 16),
          //         Padding(
          //           padding: const EdgeInsets.only(right: 8.0),
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 color: Color.fromRGBO(167, 206, 180, 1),
          //                 // const Color.fromRGBO(236, 163, 163, 1),
          //                 borderRadius: BorderRadius.circular(30)),
          //             height: 100,
          //             width: (size.width - 32) / 2,
          //             child: Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: Center(
          //                 child: Text(
          //                   "Sounds",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 22,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 12),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 8, right: 8),
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.pushNamed(context, HowItWorks.routeNamed);
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: const Color.fromRGBO(236, 163, 163, 1),
          //               borderRadius: BorderRadius.circular(30)),
          //           height: 100,
          //           width: (size.width),
          //           child: Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: Center(
          //               child: Text(
          //                 "How it Works",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 22,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
