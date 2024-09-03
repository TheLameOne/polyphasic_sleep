class TypesModel {
  int? id;
  String? scheduleType;
  String? shortDescription;
  String? totalSleep;
  String? classification;
  int? difficulty;
  String? idealScheduling;
  List<dynamic>? setup;
  String? link;

  TypesModel({
    this.id,
    this.scheduleType,
    this.shortDescription,
    this.totalSleep,
    this.classification,
    this.difficulty,
    this.idealScheduling,
    this.setup,
    this.link,
  });

  TypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduleType = json['schedule_type'];
    shortDescription = json['short_description'];
    totalSleep = json['Total Sleep'];
    classification = json['classification'];
    difficulty = json['Difficulty'];
    idealScheduling = json['ideal_scheduling'];
    setup = json['setup'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['schedule_type'] = scheduleType;
    data['short_description'] = shortDescription;
    data['Total Sleep'] = totalSleep;
    data['classification'] = classification;
    data['Difficulty'] = difficulty;
    data['ideal_scheduling'] = idealScheduling;
    data['setup'] = setup;
    data['link'] = link;

    return data;
  }
}
