import 'package:get/get.dart';

import '../../model/classes/level.dart';
import '../../model/services/level_servise.dart';

class LevelController extends GetxController {
  var isLoading = true.obs;
  var levelId = 0.obs;
  RxList<Level> levelList = <Level>[].obs;

  @override
  void onInit() {
    fetchLevels();
    super.onInit();
  }

  void fetchLevels() async {
    try {
      isLoading(true);
      levelList.value = await LevelService.fetchLevels();
    } finally {
      isLoading(false);
    }
  }
}
