import '/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/level_controller.dart';
import '../model/widget/item.dart';
import '../model/widget/app_bar.dart';

class LevelView extends GetView<LevelController> {
  const LevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "الصفوف الدراسية"),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: controller.levelList.length,
                  itemBuilder: (context, index) => item(
                      name: controller.levelList[index].levelName!,
                      bottomLeft: Color(int.parse(
                          controller.levelList[index].bottomLeftColor!)),
                      topRight: Color(int.parse(
                          controller.levelList[index].topRightColor!)),
                      num: controller.levelList[index].levelPic!,
                      path: 'assets/num',
                      fontSize: 28,
                      onTap: () {
                        controller.levelId.value =
                            controller.levelList[index].id!;
                        Get.toNamed(Routes.semester,
                            arguments: controller.levelList[index].id!);
                      }));
            }
          },
        ),
      ),
    );
  }
}
