class ClassificationModel {
  String? scheduleName;
  String? shortDescription;
  String? difficulty;
  String? totalSleep;
  String? link;
  String? svgPath;
  int? chartId;
  List<int>? contains;

  ClassificationModel(
      {this.scheduleName,
      this.shortDescription,
      this.difficulty,
      this.totalSleep,
      this.link,
      this.contains,
      this.svgPath,
      this.chartId});

  ClassificationModel.fromJson(Map<String, dynamic> json) {
    scheduleName = json['schedule_name'];
    shortDescription = json['short_description'];
    difficulty = json['difficulty'];
    totalSleep = json['total_sleep'];
    link = json['link'];
    svgPath = json['svg_path'];
    chartId = json['chart_id'];
    contains = json['contains'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schedule_name'] = scheduleName;
    data['short_description'] = shortDescription;
    data['difficulty'] = difficulty;
    data['total_sleep'] = totalSleep;
    data['link'] = link;
    data['svg_path'] = svgPath;
    data['contains'] = contains;
    data['chart_id'] = chartId;
    return data;
  }
}
