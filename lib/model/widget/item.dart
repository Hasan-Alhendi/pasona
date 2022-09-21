import 'package:flutter/material.dart';

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
            0.2,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
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
                  child: Image.asset(
                    "$path/$num.png",
                    height: 70,
                    width: 45,
                  ),
                ),
              Expanded(
                child: Row(
                  children: [
                    /* const SizedBox(
                      width: 20,
                    ), */
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontFamily: 'Cocon Next Arabic',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}
