import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/test_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "إختبارات المادة"),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  itemCount: controller.testList.length,
                  itemBuilder: (context, index) {
                    return item(
                        name: controller.testList[index].testName!,
                        fontSize: 32,
                        bottomLeft: Color(int.parse(
                            controller.testList[index].bottomLeftColor!)),
                        topRight: Color(int.parse(
                            controller.testList[index].topRightColor!)),
                        //  num: controller.testList[index].subjectPic!,
                        onTap: () {
                          controller.testId.value =
                              controller.testList[index].id!;
                          Get.toNamed(Routes.exam,
                              arguments: controller.testList[index].link!);

                          // viewBottomSheet(showVideo: () {}, exam: () {});
                        });
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
