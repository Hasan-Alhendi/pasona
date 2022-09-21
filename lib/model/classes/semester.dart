class Semester {
  int? id;
  int? levelId;
  String? semesterName;
  String? topRightColor;
  String? bottomLeftColor;
  Semester({
    required this.id,
    required this.levelId,
    required this.semesterName,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelId = json['class_room_id'];
    semesterName = json['name'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
