// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../control/controllers/splash_controller.dart';

class SplashScreenView extends GetView<SplashController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (_) {
          return Scaffold(
            body: initScreen(context),
          );
        });
  }

  initScreen(BuildContext context) {
    /*  AssetImage assetImage = const AssetImage("assets/Basona.png");
    Image image = Image(
      image: assetImage,
      // height: 500.0,
      //width: 250.0,
    ); */
    SvgPicture image = SvgPicture.asset(
      'assets/Basona Logo.svg',
    );
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xff7990DD),
              gradient: LinearGradient(
                  colors: const [(Color(0xff7990DD)), Color(0xff374ABE)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.045,
                  right: MediaQuery.of(context).size.width * 0.045,
                  top: MediaQuery.of(context).size.height * 0.07),
              child: image,
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              // backgroundColor: Colors.white,
              color: Color.fromARGB(180, 3, 35, 100),
              strokeWidth: 3,
            )
          ],
        )
      ],
    );
  }
}
