import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Widget _screen =
      (GetStorage().read("key") != null) ? const MyApp() : const MyPage();
  runApp(_screen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // initialRoute: Routes.level,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          backgroundColor: Colors.teal),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          backgroundColor: Colors.teal),
    );
  }
}
