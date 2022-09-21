import 'package:get/get.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class ExamController extends GetxController {
  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    super.onInit();
  }
}
