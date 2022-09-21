import 'package:get/get.dart';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import 'http_client.dart';
import '../../control/controllers/lesson_controller.dart';
import '../classes/test.dart';

class TestService {
  static Future<List<Test>> fetchTests() async {
    List<Test> loadedTests = [];
    LessonController controller = Get.find();
    int unitId = controller.lessonId.value;
    final response = await HttpClient()
        .get(Const.url, '/tests/show/$unitId')
        .catchError(BaseController.handleError);
    if (response == null) return loadedTests;
    List jsonData = response;

    for (var item in jsonData) {
      loadedTests.add(Test.fromJson(item));
    }

    return loadedTests;
  }
}
