class Unit {
  int? id;
  int? sbjId;
  String? unitName;
  String? topRightColor;
  String? bottomLeftColor;
  Unit({
    required this.id,
    required this.sbjId,
    required this.unitName,
    required this.topRightColor,
    required this.bottomLeftColor,
  });

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sbjId = json['subject_id'];
    unitName = json['name'];
    topRightColor = json['color_1'];
    bottomLeftColor = json['color_2'];
  }
}
