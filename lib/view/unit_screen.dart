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
    return Scaffold(
      appBar: appBar(title: "الوحدات"),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return unitsMethod(context);
          }
        },
      ),
    );
  }

  Directionality unitsMethod(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SizedBox(
          //  width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: controller.unitList.length,
            itemBuilder: (context, index) => item(
                name: controller.unitList[index].unitName!,
                bottomLeft: Color(
                    int.parse(controller.unitList[index].bottomLeftColor!)),
                topRight:
                    Color(int.parse(controller.unitList[index].topRightColor!)),
                fontSize: 30,
                onTap: () {
                  controller.unitId.value = controller.unitList[index].id!;
                  Get.toNamed(Routes.lesson);
                }),
            /* gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
              childAspectRatio: 1,
              // mainAxisSpacing: 50,
              //crossAxisSpacing: 20,
            ), */
          ),
        ),
      ),
    );
  }
}
