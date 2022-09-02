import 'package:flutter/material.dart';
import 'package:luxury_version_1/helper/app.dart';

class TitleAndDescription extends StatelessWidget {
  final String text1;
  final String? text2;
  final double width1;
  final double width2;
  final TextAlign textAlign;
  final TextStyle textStyle1;
  final TextStyle textStyle2;


  TitleAndDescription({
    required this.text1,
    this.text2,
    required this.width1,
    required this.width2,
    required this.textAlign,
    required this.textStyle1,
    required this.textStyle2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: App.getDeviceWidthPercent(width1, context),
          child: Text(text1,
            textAlign: textAlign,
            style: textStyle1
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: App.getDeviceWidthPercent(width2, context),
          child: Text(text2 == "" ? "" : text2!,
            textAlign: textAlign,
            style: textStyle2
          ),
        ),
      ],
    );
  }
}