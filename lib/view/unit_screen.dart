import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/unit_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class UnitView extends GetView<UnitController> {
  const UnitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.unitList = [];
        return true;
      },
      child: Scaffold(
        appBar: appBar(title: "الوحدات"),
        body: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  itemCount: controller.unitList.length,
                  itemBuilder: (context, index) => item(
                      name: controller.unitList[index].unitName!,
                      bottomLeft: Color(int.parse(
                          controller.unitList[index].bottomLeftColor!)),
                      topRight: Color(
                          int.parse(controller.unitList[index].topRightColor!)),
                      fontSize: 23,
                      onTap: () {
                        controller.unitId.value =
                            controller.unitList[index].id!;
                        Get.toNamed(Routes.lesson,
                            arguments: controller.unitList[index].id!);

                        // viewBottomSheet(showVideo: () {}, exam: () {});
                      }),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
