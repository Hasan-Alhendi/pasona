import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../control/controllers/semester_controller.dart';
import '../model/widget/app_bar.dart';
import '../model/widget/item.dart';
import '../routes.dart';

class SemesterView extends GetView<SemesterController> {
  const SemesterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar(title: "الفصل الدراسي"),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      height: (mq.size.height -
                              appBar(title: '').preferredSize.height -
                              mq.padding.top) *
                          0.008,
                    ),
                    semesterMethod(context),
                    Expanded(
                      child: Opacity(
                        opacity: 1,
                        child: SvgPicture.asset(
                          'assets/Basona Logo.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget semesterMethod(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.semesterList.length,
      itemBuilder: (context, index) => item(
        name: controller.semesterList[index].semesterName!,
        bottomLeft:
            Color(int.parse(controller.semesterList[index].bottomLeftColor!)),
        topRight:
            Color(int.parse(controller.semesterList[index].topRightColor!)),
        fontSize: 30,
        onTap: () {
          controller.semesterId.value = controller.semesterList[index].id!;
          Get.toNamed(Routes.subject);
        },
      ),
      /* gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
        // childAspectRatio: 1,
        // mainAxisSpacing: 50,
        //crossAxisSpacing: 20,
      ), */
    );
  }
}
