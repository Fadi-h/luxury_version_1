import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:luxury_version_1/helper/app.dart';

class TitleAndDescription extends StatelessWidget {
  final String text1;
  final double? width1;
  final TextStyle? textStyle1;


  TitleAndDescription({
    required this.text1,
    this.width1,
    this.textStyle1,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: App.getDeviceWidthPercent(width1, context),
          child: Html(
            data: text1,
            style: {
              "body": Style(
                fontSize: FontSize(CommonTextStyle.mediumTextStyle),
                fontWeight: FontWeight.normal,
                letterSpacing: 0.3,
                color: App.lightGrey,
                textAlign: TextAlign.center
              ),
              "h1" : Style(
                  color: App.orange,
                  textAlign: TextAlign.center,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize(CommonTextStyle.xXlargeTextStyle)
              )
            },
          ),
        ),
      ],
    );
  }
}