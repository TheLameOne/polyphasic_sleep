class SetupModel {
  final int id;
  final String scheduleName;
  final String totalSleep;
  final List<int> setup;
  final String svg;
  final int difficulty;
  final String shortDesc;
  final String classification;

  SetupModel(
      {required this.id,
      required this.scheduleName,
      required this.totalSleep,
      required this.setup,
      required this.svg,
      required this.difficulty,
      required this.shortDesc,
      required this.classification});

  factory SetupModel.fromJson(Map<String, dynamic> json) {
    return SetupModel(
        id: json['id'],
        scheduleName: json['schedule_type'],
        totalSleep: json['Total Sleep'],
        setup: List<int>.from(json['setup']),
        svg: json['svg'],
        shortDesc: json['short_description'],
        difficulty: json['Difficulty'],
        classification: json['classification']);
  }
}
