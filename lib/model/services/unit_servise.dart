import 'package:get/get.dart';
import '../../const.dart';
import '../../control/controllers/base_controller.dart';
import 'http_client.dart';
import '../../control/controllers/subject_controller.dart';
import '../classes/Unit.dart';

class UnitService {
  static Future<List<Unit>> fetchUnits() async {
    List<Unit> loadedUnits = [];
    SubjectController controller = Get.find();
    int subjectId = controller.subjectId.value;
    final response = await HttpClient()
        .get(Const.url, '/units/show/$subjectId')
        .catchError(BaseController.handleError);
    if (response == null) return loadedUnits;
    List jsonData = response;

    for (var item in jsonData) {
      loadedUnits.add(Unit.fromJson(item));
    }

    return loadedUnits;
  }
}
