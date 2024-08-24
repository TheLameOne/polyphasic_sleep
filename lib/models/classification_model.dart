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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_name'] = this.scheduleName;
    data['short_description'] = this.shortDescription;
    data['difficulty'] = this.difficulty;
    data['total_sleep'] = this.totalSleep;
    data['link'] = this.link;
    data['svg_path'] = this.svgPath;
    data['contains'] = this.contains;
    data['chart_id'] = this.chartId;
    return data;
  }
}
