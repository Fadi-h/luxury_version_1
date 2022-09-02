import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/controller/rent_terms_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';



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
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
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
    return Column(
      children: [
        TitleAndDescription(
        text1: "RENTAL TERMS",
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
        SizedBox(height: 15),
        Column(
          children: [
            TitleAndDescription(
              text1: "Delivery And Return",
              text2: "Luxury Rental Car Company Specializes In Cars Of The Premium Segment. We Know How To Please A Demanding Client And How To Provide Rental Services Of The Highest Quality. Being Our Client, You Will Feel A Superb Level Of Luxury And Comfort.",
              textAlign: TextAlign.start,
              textStyle1: const TextStyle(
                letterSpacing: 1,
                height: 1.3,
                fontSize: CommonTextStyle.largeTextStyle,
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
              width2: 90,
            ),
            SizedBox(height: 30),
            TitleAndDescription(
              text1: "Damage, Loss, Theft Etc",
              text2: "Luxury Rental Car Company Specializes In Cars Of The Premium Segment. We Know How To Please A Demanding Client And How To Provide Rental Services Of The Highest Quality. Being Our Client, You Will Feel A Superb Level Of Luxury And Comfort.",
              textAlign: TextAlign.start,
              textStyle1: const TextStyle(
                letterSpacing: 1,
                height: 1.3,
                fontSize: CommonTextStyle.largeTextStyle,
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
              width2: 90,
            ),
            SizedBox(height: 30),
            TitleAndDescription(
              text1: "Changes",
              text2: "Luxury Rental Car Company Specializes In Cars Of The Premium Segment. We Know How To Please A Demanding Client And How To Provide Rental Services Of The Highest Quality. Being Our Client, You Will Feel A Superb Level Of Luxury And Comfort.",
              textAlign: TextAlign.start,
              textStyle1: const TextStyle(
                letterSpacing: 1,
                height: 1.3,
                fontSize: CommonTextStyle.largeTextStyle,
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
              width2: 90,
            ),
          ],
        )
      ],
    );
  }
}
