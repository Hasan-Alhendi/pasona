class Level {
  int? id;
  String? levelName;
  String? level;
  String? levelPic;
  String? topRightColor;
  String? bottomLeftColor;
  Level({
    required this.id,
    required this.levelName,
    required this.level,
    required this.levelPic,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelName = json['name'];
    level = json['level'];
    levelPic = json['img_url'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
