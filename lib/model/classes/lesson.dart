class Lesson {
  int? id;
  int? unitId;
  String? lessonName;
  String? topRightColor;
  String? bottomLeftColor;
  Lesson({
    required this.id,
    required this.unitId,
    required this.lessonName,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'] /*?.toInt()*/;
    unitId = json['unit_id'] /*?.toInt()*/;
    lessonName = json['name'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
