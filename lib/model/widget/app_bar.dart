import 'package:flutter/material.dart';

AppBar appBar({required String title}) {
  return AppBar(
    /*  leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ), */
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Cocon Next Arabic',
        fontSize: 26,
      ),
    ),
    centerTitle: true,
    elevation: 2,
  );
}
