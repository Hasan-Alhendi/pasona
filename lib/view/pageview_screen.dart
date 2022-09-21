import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../control/controllers/page_view_controller.dart';
import '../model/classes/page_view.dart';
import '../routes.dart';

class PageViewScreen extends GetView<PageViewController> {
  PageViewScreen({Key? key}) : super(key: key);
  final List<PageViewData> data = [
    //1
    PageViewData(
      title: "أهلا و سهلا بك\nفي منصة\nالتعليم الإلكتروني",
      desc: "يمكننا مساعدتك\n.لتطور مهارتك إلى الأفضل",
      imgUrl: 'assets/pageview/1.png',
    ),
    //2
    PageViewData(
      title: 'يمكنك مشاهدة الفيديوهات\nلتنمية المهارات',
      desc: "يمكننا مساعدتك\n.لتطور مهارتك إلى الأفضل",
      imgUrl: 'assets/pageview/2.png',
    ), //3
    //3
    PageViewData(
      title: 'يمكنك إجراء الإختبارات\nلتحديد المستوى العلمي',
      desc: "يمكننا مساعدتك\n.لتطور مهارتك إلى الأفضل",
      imgUrl: 'assets/pageview/3.png',
    ),
    //4
    PageViewData(
      title: 'استمر في التعلم\nلتصل إلى هدفك',
      desc: "يمكننا مساعدتك\n.لتطور مهارتك إلى الأفضل",
      imgUrl: 'assets/pageview/4.png',
    ),
    //5
    PageViewData(
      title: 'انصم الى منصة\nالتعلم الاكتروني',
      desc: "يمكننا مساعدتك\n.لتطور مهارتك إلى الأفضل",
      imgUrl: 'assets/pageview/5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (val) {
                controller.currindex.value = val;
                if (controller.currindex.value == 4) {
                  Future.delayed(const Duration(seconds: 3),
                      () => Get.offNamed(Routes.level));
                  var storage = GetStorage();
                  storage.write("key", "x");
                }
              },
              children: data
                  .map(
                    (item) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(item.imgUrl),
                            fit: BoxFit.contain),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const Alignment(0, -0.6),
                              child: Text(
                                item.title,
                                maxLines: 3,
                                style: const TextStyle(
                                    //color: Color(0xff573353),
                                    fontSize: 32,
                                    fontFamily: "Cocon Next Arabic",
                                    fontWeight: FontWeight.w700,
                                    height: 1.2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const Alignment(0, 0.25),
                              child: Text(
                                item.desc,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cocon Next Arabic",

                                  //color: Color(0xff573353),
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            Align(
                alignment: const Alignment(0, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.currindex.value++;
                        },
                        child: const Text(
                          'التالي',
                          style: TextStyle(
                            fontFamily: "Cocon Next Arabic",
                          ),
                        )),
                    _buildPageViewIndicator(),
                    TextButton(
                        onPressed: () {
                          var storage = GetStorage();
                          storage.write("key", "x");
                          Get.offNamed(Routes.level);
                        },
                        child: const Text(
                          'تخطي',
                          style: TextStyle(
                            fontFamily: "Cocon Next Arabic",
                          ),
                        )),
                  ],
                )),
            // ),
          ],
        ),
      ),
    );
  }

  SmoothPageIndicator _buildPageViewIndicator() {
    return SmoothPageIndicator(
        controller: controller.pageController,
        count: data.length,
        textDirection: TextDirection.rtl,
        effect: const ScrollingDotsEffect(
          dotColor: Color(0xfffda758),
          activeDotScale: 1.15,
        )
        /* const JumpingDotEffect(
        dotColor: Color(0xfffda758),
        dotHeight: 16,
        dotWidth: 16,
        jumpScale: .7,
        verticalOffset: 15,
      ), */
        );
  }
}
