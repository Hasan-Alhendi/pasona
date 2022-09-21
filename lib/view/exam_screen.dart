import '../model/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../control/controllers/test_controller.dart';

class ExamView extends GetView<TestController> {
  const ExamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "الإختبار"),
      body: WebView(
        initialUrl: Get.arguments,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
