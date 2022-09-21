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
    return WillPopScope(
      onWillPop: () async {
        controller.semesterList = [];
        return true;
      },
      child: Scaffold(
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
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.semesterList.length,
                        itemBuilder: (context, index) => item(
                          name: controller.semesterList[index].semesterName!,
                          bottomLeft: const Color(0xffef7590),
                          topRight: const Color(0xffffd380),
                          fontSize: 23,
                          onTap: () {
                            controller.semesterId.value =
                                controller.semesterList[index].id!;
                            Get.toNamed(Routes.subject,
                                arguments: controller.semesterList[index].id!);
                          },
                          //fontSize: 23,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Image.asset(
                      "assets/logo.png",
                      //  width: 450,
                    )),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
