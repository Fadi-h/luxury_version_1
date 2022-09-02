import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/blog_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';


class Blog extends StatelessWidget {
  Blog({Key? key}) : super(key: key);


  BlogController blogController = Get.put(BlogController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: blogController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            faq(context),
          ],
        )
    );
  }

  faq(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top,),
          header(context),
          SizedBox(height: 15),
          body(context),
          SizedBox(height: 20),
          Footer(introductionController: introductionController)
        ],
      ),
    );
  }
  header(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(100, context),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/top-nav.png"),
              fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                blogController.key.currentState!.openDrawer();
              },
              child: Icon(Icons.menu,size: CommonTextStyle.headerIcons,color: App.orange),
            ),
            GestureDetector(
              onTap: () {
                homeController.selectNavDrawer.value = 0;
                homeController.key.currentState!.openEndDrawer();
              },
              child: Container(
                child: SvgPicture.asset("assets/icons/logo.svg",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
  body(BuildContext context) {
    return Column(
      children: [
        TitleAndDescription(
          text1: "LUXURY BLOGS CAR",
          text2: "",
          textAlign: TextAlign.center,
          textStyle1: const TextStyle(
            letterSpacing: 1,
            height: 1.3,
            fontSize: CommonTextStyle.xXlargeTextStyle,
            color: App.orange,
            fontWeight: FontWeight.bold,
          ),
          textStyle2: const TextStyle(
              letterSpacing: 0.3,
              height: 1.3,
              fontSize: CommonTextStyle.smallTextStyle,
              color: App.field,
              fontWeight: FontWeight.normal
          ),
          width1: 90,
          width2: 85,
        ),
        Container(
          width: App.getDeviceWidthPercent(90, context),
          height: App.getDeviceHeightPercent(30, context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/about.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("aaaaaaa",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: CommonTextStyle.mediumTextStyle
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: Divider(
            color: App.field.withOpacity(0.5),
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
        ),
      ],
    );
  }
}
