import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/view/home.dart';

class Introduction extends StatefulWidget {

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  IntroductionController introductionController = Get.put(IntroductionController());

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    )
    );
  }
  startTime() async {
    var duration = Duration(seconds: 1);
    return Timer(duration, route);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.png"),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}
