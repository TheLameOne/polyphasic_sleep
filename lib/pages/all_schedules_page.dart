import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/components/schedule_component.dart';
import 'package:polyphasic_sleep_new/models/classification_model.dart';
import 'package:polyphasic_sleep_new/models/schedules_model.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class AllSchedulesPage extends StatefulWidget {
  const AllSchedulesPage({super.key});

  @override
  State<AllSchedulesPage> createState() => _AllSchedulesPageState();
}

class _AllSchedulesPageState extends State<AllSchedulesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("S C H E D U L E S",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          FutureBuilder(
            future: readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                List<Container> list = [];
                // print(snapshot.data);
                for (int i = 0; i < snapshot.data!.length; i++) {
                  list.add(Container(
                    alignment: Alignment.center,
                    child: NeuBox(
                        padding: false,
                        child: ScheduleComponent(
                          chartId: snapshot.data![i].chartId!,
                          name: snapshot.data![i].scheduleName!,
                          desc: snapshot.data![i].shortDescription!,
                          difficulty: snapshot.data![i].difficulty!,
                          totalSleep: snapshot.data![i].totalSleep!,
                          link: snapshot.data![i].link!,
                          svgPath: (Provider.of<ThemeProvider>(context,
                                      listen: false)
                                  .isDarkMode)
                              ? "assets/svg/dark/${snapshot.data![i].svgPath}.svg"
                              : "assets/svg/light/${snapshot.data![i].svgPath}.svg",
                          contains: snapshot.data![i].contains!,
                        )),
                    // color: Colors.blue,
                  ));
                }
                return Flexible(
                  child: CardSwiper(
                    cardsCount: snapshot.data!.length,
                    cardBuilder: (context, index, percentThresholdX,
                            percentThresholdY) =>
                        list[index],
                  ),
                );
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),
          Container(
            height: size.height * 0.15,
          )
        ],
      ),
      // body: FutureBuilder(
      //     future: readJsonData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Center(child: Text(snapshot.error.toString()));
      //       } else if (snapshot.hasData) {
      //         return SingleChildScrollView(
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8),
      //             child: Column(
      //               children: [
      //                 for (int i = 0; i < snapshot.data!.length; i++)
      //                   ScheduleComponent(
      //                     name: snapshot.data![i].scheduleName
      //                         .toString()
      //                         .toUpperCase(),
      //                     desc: snapshot.data![i].types!,
      //                   ),
      //               ],
      //             ),
      //           ),
      //         );
      //       } else {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     }),
    );
  }
}

Future<List<ClassificationModel>> readJsonData() async {
  final jsondata =
      await rootbundle.rootBundle.loadString('json/classification.json');
  // print(jsondata);
  final list = json.decode(jsondata) as List<dynamic>;
  List<ClassificationModel> res = [];
  for (var item in list) {
    res.add(ClassificationModel.fromJson(item));
  }
  return res;
  // return list.map((e) => DataModel.fromJson(e)).toList();
}
