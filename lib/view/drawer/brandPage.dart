import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/brands_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';



class BrandPage extends StatelessWidget {
  BrandPage({Key? key}) : super(key: key);

  BrandsController brandsController = Get.put(BrandsController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: brandsController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Obx(() => Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            brands(context),
          ],
        ))
    );
  }

  brands(BuildContext context) {
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
                brandsController.key.currentState!.openDrawer();
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
          text1: "LUXURY BRANDS CAR",
          text2: "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry's.",
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
              color: App.lightGrey,
              fontWeight: FontWeight.normal
          ),
          width1: 90,
          width2: 85,
        ),
        SizedBox(height: 15),
        Container(
          width: App.getDeviceWidthPercent(95, context),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemCount: brandsController.brands.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: () {
                    ///
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SvgPicture.asset(brandsController.brands[index],width: 100,height: 100,fit: BoxFit.fitHeight,)),
                );
              }),
        ),
      ],
    );
  }
}
