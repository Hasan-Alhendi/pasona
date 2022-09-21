import 'package:get/get.dart';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import 'http_client.dart';
import '../../control/controllers/semester_controller.dart';
import '../classes/subject.dart';

class SubjectService {
  static Future<List<Subject>> fetchSubjects() async {
    List<Subject> loadedSubjects = [];
    SemesterController controller = Get.find();
    int semesterId = controller.semesterId.value;
    final response = await HttpClient()
        .get(Const.url, '/subject/show/$semesterId')
        .catchError(BaseController.handleError);
    if (response == null) return loadedSubjects;
    List jsonData = response;

    for (var item in jsonData) {
      loadedSubjects.add(Subject.fromJson(item));
    }

    return loadedSubjects;
  }
}
