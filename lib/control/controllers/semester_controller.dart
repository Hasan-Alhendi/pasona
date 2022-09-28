import 'package:get/get.dart';

import '../../model/classes/semester.dart';
import '../../model/services/semester_servise.dart';

class SemesterController extends GetxController {
  var isLoading = true.obs;
  var semesterId = 0.obs;
  RxList<int> v = <int>[].obs;
  RxList<Semester> semesterList = <Semester>[].obs;

  @override
  void onInit() {
    fetchSemesters();
    super.onInit();
  }

  void fetchSemesters() async {
    try {
      isLoading(true);
      semesterList.value = await SemesterService.fetchSemesters();
    } finally {
      isLoading(false);
    }
  }
}
