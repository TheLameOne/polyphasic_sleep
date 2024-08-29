import 'dart:async';
import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/schedule_type_details.dart';
import 'package:polyphasic_sleep_new/models/types_model.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ScheduleTypesPage extends StatefulWidget {
  final List<int> contains;
  final String title;
  const ScheduleTypesPage(
      {super.key, required this.contains, required this.title});

  @override
  State<ScheduleTypesPage> createState() => _ScheduleTypesPageState();
}

class _ScheduleTypesPageState extends State<ScheduleTypesPage> {
  Future<List<TypesModel>> readJsonData() async {
    final jsondata = await rootbundle.rootBundle.loadString('json/types.json');
    // print(jsondata);
    final list = json.decode(jsondata) as List<dynamic>;
    List<TypesModel> res = [];
    for (var item in list) {
      if (widget.contains.contains(item['id'])) {
        res.add(TypesModel.fromJson(item));
      }
    }
    return res;
  }

  List<Color> color = [];
  @override
  void initState() {
    _loadColors();
    super.initState();
  }

  _loadColors() {
    var x = Provider.of<ThemeProvider>(context, listen: false).getThemeList();
    // Fix this later
    for (int i = 0; i < x.length; i++) {
      color.add(x[i].colorScheme.secondaryContainer);
    }
    for (int i = 0; i < x.length; i++) {
      color.add(x[i].colorScheme.secondaryContainer);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> names = [];
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(widget.title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20)),
          ),
        )),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: FutureBuilder(
            future: readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                for (int i = 0; i < snapshot.data!.length; i++) {
                  names.add(snapshot.data![i].scheduleType!);
                }
                return Center(
                  child: Swiper(
                    scrollDirection: Axis.vertical,
                    viewportFraction: 0.6,

                    scale: 0.5,

                    // autoplay: true,
                    // layout: SwiperLayout.STACK,
                    // itemWidth: 300.0,
                    // itemHeight: 300,

                    itemCount: snapshot.data!.length,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Theme.of(context).colorScheme.primary,
                          activeColor: Theme.of(context).colorScheme.onPrimary),
                    ),
                    control: const SwiperControl(
                      color: Color(0xff38547C),
                    ),

                    itemBuilder: (context, index) {
                      // print(index);
                      return Padding(
                        padding: const EdgeInsets.only(right: 32.0, left: 16),
                        child: Container(
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                            child: ScheduleTypeDetails(
                              id: snapshot.data![index].id!,
                              scheduleType: snapshot.data![index].scheduleType!,
                              shortDescription:
                                  snapshot.data![index].shortDescription!,
                              totalSleep: snapshot.data![index].totalSleep!,
                              classification:
                                  snapshot.data![index].classification!,
                              difficulty:
                                  snapshot.data![index].difficulty!.toDouble(),
                              idealScheduling:
                                  snapshot.data![index].idealScheduling!,
                              link: snapshot.data![index].link!,
                              setup: snapshot.data![index].setup!,
                              color: color[index],
                            )),
                      );
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
