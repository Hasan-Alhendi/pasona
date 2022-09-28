import 'package:get/get.dart';

import '../../model/classes/test.dart';
import '../../model/services/test_servise.dart';

class TestController extends GetxController {
  var isLoading = true.obs;
  var testId = 0.obs;
  RxList<Test> testList = <Test>[].obs;

  @override
  void onInit() {
    fetchTests();
    super.onInit();
  }

  void fetchTests() async {
    try {
      isLoading(true);
      testList.value = await TestService.fetchTests();
    } finally {
      isLoading(false);
    }
  }
}
