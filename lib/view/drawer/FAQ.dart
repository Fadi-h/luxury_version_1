import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/faq_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';



class FAQ extends StatelessWidget {
  FAQ() {
    faqController.open.value = 0;
  }

  FAQController faqController = Get.put(FAQController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: faqController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Obx(() => Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            faq(context),
          ],
        ))
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
                faqController.key.currentState!.openDrawer();
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
          text1: "LUXURY FAQ CAR",
          text2: "Luxury Rental Car Company Specializes In Cars Of The Premium Segment. We Know How To Please A Demanding Client And How To Provide Rental Services Of The Highest Quality. Being Our Client, You Will Feel A Superb Level Of Luxury And Comfort.",
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
        SizedBox(height: 30),
        Center(
          child: Text("FEQs: GET MORE Information About Car Rental Services",
            style: TextStyle(
                fontSize: CommonTextStyle.tinyTextStyle,
                color: Colors.white
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            GestureDetector(
              onTap:(){
                if(faqController.open.value == 0){
                  faqController.open.value = -1;
                }
                else{
                  faqController.open.value = 0;
                }
              },
              child: Container(
                width: App.getDeviceWidthPercent(90, context),
                decoration: BoxDecoration(
                    color: faqController.open.value == 0 ? App.orange : App.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: faqController.open.value == 0 ? Radius.circular(0) : Radius.circular(10),
                      bottomRight: faqController.open.value == 0 ? Radius.circular(0) : Radius.circular(10),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerWithImage(
                          width: 25,
                          height: 25,
                          image: "assets/images/faq.png",
                          option: 1
                      ),
                      Container(
                        width: App.getDeviceWidthPercent(63, context),
                        child: Text("What does the car rental actually cover?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: CommonTextStyle.mediumTextStyle,
                            letterSpacing: 0.3,
                            height: 1.3,
                          ),),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Container(
                width: App.getDeviceWidthPercent(90, context),
                child: !(faqController.open.value == 0)
                    ? Center()
                    :  Container(
                  width: App.getDeviceWidthPercent(90, context),
                  decoration: BoxDecoration(
                      color: App.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: faqController.open.value == 0 ? Radius.circular(0) : Radius.circular(10),
                        topRight: faqController.open.value == 0 ? Radius.circular(0) : Radius.circular(10),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: App.getDeviceWidthPercent(80, context),
                          child: Text("It covers rental. insurance, delivery and pick-up service>",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: CommonTextStyle.mediumTextStyle,
                              letterSpacing: 0.3,
                              height: 1.3,
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
