import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  var currindex = 0.obs;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currindex < 4) {
        currindex++;
      } else {
        timer.cancel();
      }
      pageController.animateToPage(currindex.value,
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    });
    super.onInit();
  }
}
