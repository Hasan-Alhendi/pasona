import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bar.dart';

GestureDetector item({
  required String name,
  required Color bottomLeft,
  required Color topRight,
  String? num,
  String? path,
  required double fontSize,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Builder(builder: (context) {
      var mq = MediaQuery.of(context);

      return Container(
        height: (mq.size.height -
                appBar(title: '').preferredSize.height -
                mq.padding.top) *
            0.15,
        margin: EdgeInsets.symmetric(
            vertical: (mq.size.height -
                    appBar(title: '').preferredSize.height -
                    mq.padding.top) *
                0.008,
            horizontal: mq.size.width * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                topRight,
                bottomLeft,
              ]),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (num != null && path != null)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: SvgPicture.asset(
                        "$path/$num.svg",
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: textMethod(name, fontSize),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

/* 
Text textMethod1(String name, double fontSize) {
  return Text(
    name,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontFamily: 'Cocon Next Arabic',
    ),
  );
}

 */
AutoSizeText textMethod(String name, double fontSize) {
  return AutoSizeText(
    name,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontFamily: 'Cocon Next Arabic',
    ),
    minFontSize: 18,
    maxFontSize: fontSize,
    maxLines: 4,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}
