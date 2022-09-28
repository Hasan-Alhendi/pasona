import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/semester_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class SemesterView extends GetView<SemesterController> {
  const SemesterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "الفصل الدراسي"),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  semesterMethod(context),
                  Expanded(
                    child: Image.asset(
                      "assets/logo.png",
                      // width: 100,
                      //height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget semesterMethod(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          // width: MediaQuery.of(context).size.width * 0.65,
          child: GridView.builder(
            itemCount: controller.semesterList.length,
            itemBuilder: (context, index) => item(
              name: controller.semesterList[index].semesterName!,
              bottomLeft: const Color(0xffef7590),
              topRight: const Color(0xffffd380),
              fontSize: 32,
              onTap: () {
                controller.semesterId.value =
                    controller.semesterList[index].id!;
                Get.toNamed(Routes.subject);
              },
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
              // childAspectRatio: 1,
              // mainAxisSpacing: 50,
              //crossAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
