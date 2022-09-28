import 'package:get/get.dart';

import '../../model/classes/lesson.dart';
import '../../model/services/lesson_servise.dart';

class LessonController extends GetxController {
  var isLoading = true.obs;
  var lessonId = 0.obs;
  RxList<Lesson> lessonList = <Lesson>[].obs;

  @override
  void onInit() {
    fetchLessons();
    super.onInit();
  }

  void fetchLessons() async {
    try {
      isLoading(true);
      lessonList.value = await LessonService.fetchLessons();
    } finally {
      isLoading(false);
    }
  }
}
