import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/subject_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class SubjectView extends GetView<SubjectController> {
  const SubjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "مواد الفصل"),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: controller.subjectList.length,
                itemBuilder: (context, index) {
                  return item(
                      name: controller.subjectList[index].subjectName!,
                      bottomLeft: Color(int.parse(
                          controller.subjectList[index].bottomLeftColor!)),
                      topRight: Color(int.parse(
                          controller.subjectList[index].topRightColor!)),
                      num: controller.subjectList[index].subjectPic!,
                      path: "assets/sub",
                      fontSize: 32,
                      onTap: () {
                        controller.subjectId.value =
                            controller.subjectList[index].id!;
                        Get.toNamed(Routes.unit);
                      });
                },
              );
            }
          },
        ),
      ),
    );
  }
}
