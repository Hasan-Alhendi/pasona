import 'package:get/get.dart';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import 'http_client.dart';
import '../../control/controllers/level_controller.dart';
import '../classes/semester.dart';

class SemesterService {
  static Future<List<Semester>> fetchSemesters() async {
    List<Semester> loadedSemesters = [];
    LevelController controller = Get.find();
    int levelId = controller.levelId.value;

    final response = await HttpClient()
        .get(Const.url, '/chapter/show/$levelId')
        .catchError(BaseController.handleError);
    if (response == null) return loadedSemesters;
    List jsonData = response;

    for (var item in jsonData) {
      loadedSemesters.add(Semester.fromJson(item));
    }

    return loadedSemesters;
  }
}
