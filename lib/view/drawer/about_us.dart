import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/about_us_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/text_app.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';


class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);

  AboutUsController aboutUsController = Get.put(AboutUsController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: aboutUsController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Obx(() => Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            about(context),
          ],
        ))
    );
  }

  about(BuildContext context) {
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
                aboutUsController.key.currentState!.openDrawer();
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
          text1: "LUXURY RENTAL CAR",
          text2: "Luxury Rental Car Company Specializes In Cars Of The Premium Segment. We Know How To Please A Demanding Client And How To Provide Rental Services Of The Highest Quality.Being Our Client, You Will Feel A Superb Level Of Luxury And Comfort.",
          textAlign: TextAlign.center,
          textStyle1: const TextStyle(
            height: 1.3,
            letterSpacing: 1,
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
        ContainerWithImage(
            width: App.getDeviceWidthPercent(100, context),
            height: App.getDeviceHeightPercent(25, context),
            image: "assets/images/about.png",
            option: 1
        ),
        Container(
          width: App.getDeviceWidthPercent(90, context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  aboutUsController.selected.value = 0 ;
                },
                child: Container(
                  width: App.getDeviceWidthPercent(40, context),
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: aboutUsController.selected.value == 0 ? App.orange : Colors.transparent,
                          )
                      )
                  ),
                  child: Center(
                    child: Text( "Why Choose Us?",
                      style: TextStyle(
                        height: 1.3,
                        letterSpacing: 0.3,
                        color: App.orange,
                        fontSize: CommonTextStyle.mediumTextStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  aboutUsController.selected.value = 1;
                },
                child: Container(
                  width: App.getDeviceWidthPercent(40, context),
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: aboutUsController.selected.value != 0 ? App.orange : Colors.transparent
                          )
                      )
                  ),
                  child: Center(
                    child: Text( "What Do We Offer?",
                      style: TextStyle(
                        height: 1.3,
                        letterSpacing: 0.3,
                        color: App.orange,
                        fontSize: CommonTextStyle.mediumTextStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: App.getDeviceWidthPercent(85, context),
          child: aboutUsController.selected.value == 0 ?
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/checkbox.svg",color: App.lightGrey,width: 25,height: 25,),
                  TextApp(
                      width: App.getDeviceWidthPercent(75, context),
                      text: aboutUsController.whyChooseUs1,
                      textStyle: TextStyle(
                          height: 1.3,
                          color: App.lightGrey,
                          fontSize: CommonTextStyle.smallTextStyle,
                          letterSpacing: 0.3
                      )
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/checkbox.svg",color: App.lightGrey,width: 25,height: 25,),
                  TextApp(
                      width: App.getDeviceWidthPercent(75, context),
                      text: aboutUsController.whyChooseUs2,
                      textStyle: TextStyle(
                          height: 1.3,
                          color: App.lightGrey,
                          fontSize: CommonTextStyle.smallTextStyle,
                          letterSpacing: 0.3
                      )
                  )
                ],
              ),
            ],
          ) :
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/checkbox.svg",color: App.lightGrey,width: 25,height: 25,),
                  TextApp(
                      width: App.getDeviceWidthPercent(75, context),
                      text: aboutUsController.whatDoWeOffer1,
                      textStyle: TextStyle(
                          height: 1.3,
                          color: App.lightGrey,
                          fontSize: CommonTextStyle.smallTextStyle,
                          letterSpacing: 0.3
                      )
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/checkbox.svg",color: App.lightGrey,width: 25,height: 25,),
                  TextApp(
                      width: App.getDeviceWidthPercent(75, context),
                      text: aboutUsController.whatDoWeOffer2,
                      textStyle: TextStyle(
                          height: 1.3,
                          color: App.lightGrey,
                          fontSize: CommonTextStyle.smallTextStyle,
                          letterSpacing: 0.3
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
