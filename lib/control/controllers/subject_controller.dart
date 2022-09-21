import 'package:get/get.dart';

import '../../model/classes/subject.dart';
import '../../model/services/subject_servise.dart';

class SubjectController extends GetxController {
  var isLoading = true.obs;
  var subjectId = 0.obs;
  List<Subject> subjectList = <Subject>[].obs;

  @override
  void onInit() {
    fetchSubjects();
    super.onInit();
  }

  void fetchSubjects() async {
    try {
      isLoading(true);
      subjectList = await SubjectService.fetchSubjects();
    } finally {
      isLoading(false);
    }
  }
}
