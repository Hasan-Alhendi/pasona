import 'package:get/get.dart';

import '../controllers/exam_controller.dart';
import '../controllers/lesson_controller.dart';
import '../controllers/level_controller.dart';
import '../controllers/page_view_controller.dart';
import '../controllers/semester_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/subject_controller.dart';
import '../controllers/test_controller.dart';
import '../controllers/unit_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LevelController(), fenix: true);
    Get.lazyPut(() => LessonController(), fenix: true);
    Get.lazyPut(() => SemesterController(), fenix: true);
    Get.lazyPut(() => SubjectController(), fenix: true);
    Get.lazyPut(() => TestController(), fenix: true);
    Get.lazyPut(() => UnitController(), fenix: true);
    Get.lazyPut(() => ExamController(), fenix: true);
    Get.lazyPut(() => PageViewController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}
