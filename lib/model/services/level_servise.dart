import 'dart:async';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import '../classes/level.dart';
import 'http_client.dart';

class LevelService {
  static Future<dynamic> fetchLevels() async {
    final response = await HttpClient()
        .get(Const.url, '/class/show')
        .catchError(BaseController.handleError);
    final List<Level> loadedLevels = [];
    if (response == null) return loadedLevels;
    List jsonData = response;

    for (var item in jsonData) {
      loadedLevels.add(Level.fromJson(item));
    }

    return loadedLevels;
  }
}
