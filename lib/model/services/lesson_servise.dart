import 'package:get/get.dart';
import 'http_client.dart';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import '../../control/controllers/unit_controller.dart';
import '../classes/lesson.dart';

class LessonService {
  static Future<List<Lesson>> fetchLessons() async {
    List<Lesson> loadedLessons = [];
    UnitController controller = Get.find();
    int unitId = controller.unitId.value;
    final response = await HttpClient()
        .get(Const.url, '/lessons/show/$unitId')
        .catchError(BaseController.handleError);
    if (response == null) return loadedLessons;
    List jsonData = response;

    for (var item in jsonData) {
      loadedLessons.add(Lesson.fromJson(item));
    }

    return loadedLessons;
  }
}
