import 'package:get/get.dart';

import '../../model/classes/Unit.dart';
import '../../model/services/unit_servise.dart';

class UnitController extends GetxController {
  var isLoading = true.obs;
  var unitId = 0.obs;
  List<Unit> unitList = <Unit>[].obs;

  @override
  void onInit() {
    fetchUnits();
    super.onInit();
  }

  void fetchUnits() async {
    try {
      isLoading(true);
      unitList = await UnitService.fetchUnits();
    } finally {
      isLoading(false);
    }
  }
}
