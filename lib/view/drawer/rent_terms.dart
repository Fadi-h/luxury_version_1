import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/app_localization.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/controller/rent_terms_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/helper/global.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';


class RentTerms extends StatelessWidget {
  RentTerms({Key? key}) : super(key: key);

  RentTermsController rentTermsController = Get.put(RentTermsController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: rentTermsController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Stack(
          children: [
            ContainerWithImage(
                width: App.getDeviceWidthPercent(100, context),
                height: App.getDeviceHeightPercent(100, context),
                image: "assets/images/bg-terms.png",
                option: 1
            ),
            rentTerms(context),
          ],
        )
    );
  }

  rentTerms(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 70),
          // header(context),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: App.getDeviceWidthPercent(90, context),
                child: Text(App_Localization.of(context).translate("rent_terms").toUpperCase(),
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
                rentTermsController.key.currentState!.openDrawer();
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
    return Container(
      width: App.getDeviceWidthPercent(90, context),
      child: ListView.builder(
          itemCount: introductionController.terms!.data!.terms.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context , index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: App.getDeviceWidthPercent(85, context),
                  child: Html(
                    data: Global.languageCode == "en" ?
                    introductionController.terms!.data!.terms[index].titleEn :
                    introductionController.terms!.data!.terms[index].titleAr,
                    style: {
                      "body": Style(
                          fontSize: FontSize(CommonTextStyle.xXlargeTextStyle),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: App.orange,
                          textAlign: TextAlign.start
                      ),
                    },
                  ),
                ),
                Container(
                  width: App.getDeviceWidthPercent(85, context),
                  child: Html(
                    data: Global.languageCode == "en" ?
                    introductionController.terms!.data!.terms[index].descriptionEn :
                    introductionController.terms!.data!.terms[index].descriptionAr,
                    style: {
                      "body": Style(
                          fontSize: FontSize(CommonTextStyle.mediumTextStyle),
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.3,
                          color: App.lightGrey,
                          textAlign: TextAlign.start
                      ),
                    },
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
