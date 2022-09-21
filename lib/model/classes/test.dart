class Test {
  int? id;
  int? lessonId;
  String? testName;
  String? link;
  String? topRightColor;
  String? bottomLeftColor;
  Test({
    required this.id,
    required this.lessonId,
    required this.testName,
    required this.link,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'] /*?.toInt()*/;
    lessonId = json['lesson_id'] /*?.toInt()*/;
    testName = json['test_label'];
    link = json['test_link'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
