import 'package:get/get.dart';

import '../../model/classes/test.dart';
import '../../model/services/test_servise.dart';

class TestController extends GetxController {
  var isLoading = true.obs;
  var testId = 0.obs;
  List<Test> testList = <Test>[].obs;

  @override
  void onInit() {
    fetchTests();
    super.onInit();
  }

  void fetchTests() async {
    try {
      isLoading(true);
      testList = await TestService.fetchTests();
    } finally {
      isLoading(false);
    }
  }
}
