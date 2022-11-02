import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/controllers/lesson_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class LessonView extends GetView<LessonController> {
  const LessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "دروس المادة"),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  itemCount: controller.lessonList.length,
                  itemBuilder: (context, index) {
                    return item(
                        name: controller.lessonList[index].lessonName!,
                        fontSize: 30,
                        bottomLeft: Color(int.parse(
                            controller.lessonList[index].bottomLeftColor!)),
                        topRight: Color(int.parse(
                            controller.lessonList[index].topRightColor!)),
                        onTap: () {
                          controller.lessonId.value =
                              controller.lessonList[index].id!;
                          Get.toNamed(Routes.test);

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

  /*  GestureDetector subject({
    required String subject,
    // required Color shadow,
    required Color bottomLeft,
    required Color topRight,
    // required String num,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 110,
        width: 320,
        decoration: BoxDecoration(
          /* boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ], */
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                //Color.fromRGBO(233, 176, 255, 1),

                topRight,
                bottomLeft,
                //Color.fromRGBO(138, 99, 229, 1),
              ]),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            /*   Image.asset(
              'assets/sub/$num.png',
              height: 80,
            ), */
            Expanded(
              child: Text(
                subject,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontFamily: 'Cocon Next Arabic',
                ),
              ),
            ),
            /* SvgPicture.asset(
              'assets/num/num $num.svg',
              height: 80,
              semanticsLabel: 'assets/num/num $num',
            ), */

            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  } */
}
