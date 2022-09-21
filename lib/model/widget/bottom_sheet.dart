import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
void viewBottomSheet(
    {required Function() showVideo, required Function() exam}) async {
  await Get.bottomSheet(
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        //width: double.infinity,
        //height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/Teepee-Swirly.png',
                width: 200,
              ),
              const Text(
                'التعلم الإلكتروني',
                style: TextStyle(
                  color: Color(0xff573353),
                  fontSize: 28,
                  fontFamily: "Cocon Next Arabic",
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Opacity(
                opacity: 0.5,
                child: Text(
                  'يهدف هذا التطبيق إلى تسهيل عملية التعليم\nوالتعلم الذاتي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff573353),
                    fontSize: 16,
                    fontFamily: "Cocon Next Arabic",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                width: 325,
                decoration: BoxDecoration(
                  color: const Color(0xfffda758),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: showVideo,
                  child: const Text(
                    'مشاهدة الفيديوهات',
                    style: TextStyle(
                      color: Color(0xff573353),
                      fontSize: 28,
                      fontFamily: "Cocon Next Arabic",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  width: 325,
                  decoration: BoxDecoration(
                    color: const Color(0xfffff3e9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                      onPressed: exam,
                      child: const Text(
                        'إجراء اختبار',
                        style: TextStyle(
                          color: Color(0xff573353),
                          fontSize: 28,
                          fontFamily: "Cocon Next Arabic",
                          fontWeight: FontWeight.w300,
                        ),
                      ))),
            ],
          ),
        ),
      ),
      elevation: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ));
}
