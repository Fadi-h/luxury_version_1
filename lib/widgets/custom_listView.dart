import 'package:flutter/material.dart';
import 'package:luxury_version_1/helper/app.dart';

class CustomListView extends StatelessWidget {

  final double width;
  final double height;
  final int count;
  final ScrollPhysics? scrollPhysics;
  final Widget? child;

  CustomListView({
    required this.width,
    required this.height,
    required this.count,
    this.scrollPhysics,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ListView.builder(
        itemCount: count,
        shrinkWrap: true,
        physics: scrollPhysics,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return child!;
        },
      ),
    );
  }
}
