class Subject {
  int? id;
  int? semesterId;
  String? subjectName;
  String? subjectPic;
  String? topRightColor;
  String? bottomLeftColor;
  Subject({
    required this.id,
    required this.semesterId,
    required this.subjectName,
    required this.subjectPic,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    semesterId = json['chapter_id'];
    subjectName = json['name'];
    subjectPic = json['img_url'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
