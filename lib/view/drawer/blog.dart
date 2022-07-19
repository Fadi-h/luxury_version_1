import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/app.dart';

class Blog extends StatelessWidget {
  Blog({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        drawer: App.drawer(context,homeController),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    ],
                  ),
                ),
                Positioned(child: App.header(context, homeController,key))
              ],
            )
        ),
      )
    );
  }
}
