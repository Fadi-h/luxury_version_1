import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/brands_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/api.dart';
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
        body: Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            brands(context),
          ],
        )
    );
  }

  brands(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          header(context),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: App.getDeviceWidthPercent(90, context),
                child: Text("LUXURY BRANDS CAR",
                  style: TextStyle(
                    letterSpacing: 1,
                    height: 1.3,
                    fontSize: CommonTextStyle.xXlargeTextStyle,
                    color: App.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: App.getDeviceWidthPercent(90, context),
                child: Text("Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry's.",
                  style: TextStyle(
                    letterSpacing: 0.3,
                    height: 1.3,
                    fontSize: CommonTextStyle.mediumTextStyle,
                    color: App.lightGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
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
        Container(
          width: App.getDeviceWidthPercent(95, context),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemCount: introductionController.homeData!.data!.brands.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: () {
                    introductionController.carsByBrand(context,
                        introductionController.homeData!.data!.brands[index].id,index);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SvgPicture.network(
                        API.url + "/" + introductionController.homeData!.data!.brands[index].img,
                        fit: BoxFit.fitHeight,
                      )),
                );
              }),
        ),
      ],
    );
  }
}
