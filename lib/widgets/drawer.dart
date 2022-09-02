import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';

class CustomDrawer extends StatelessWidget {

  final HomeController homeController;

  CustomDrawer({
    required this.homeController,

  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: App.getDeviceWidthPercent(100, context),
      child: Drawer(
        child: Container(
          width: App.getDeviceWidthPercent(100, context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/nav-bg.webp",),
                  fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          homeController.searchIcon.value = true;
                          homeController.search.clear();
                        },
                        child: ContainerWithImage(
                            width: 30,
                            height: 30,
                            image: "assets/icons/back-icon.svg",
                            option: 0
                          ),
                        ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          child: SvgPicture.asset("assets/icons/logo.svg",
                            width: 30,
                            height: 30
                          ),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                SizedBox(height: App.getDeviceHeightPercent(5, context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 0;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 0, context, "home", CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 1;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 1, context, "about us", CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 2;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 2, context, "brands",CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 3;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 3, context, "rent terms",CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 4;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 4, context, "faq",CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 5;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 5, context, "blog",CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 6;
                        Get.back();
                        homeController.key.currentState!.openEndDrawer();
                      },
                      child: drawerText(homeController, 6, context, "contact us",CommonTextStyle.mediumTextStyle, FontWeight.normal),
                    ),
                    SizedBox(height: 10),
                    /// language
                    Column(
                      children: [
                        AnimatedContainer(
                          duration:
                          Duration(milliseconds: 300),
                          width: homeController.searchIcon.value ? 40 : MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    child: homeController.searchIcon.value ?
                                    GestureDetector(
                                      child: Icon(
                                        Icons.search,
                                        color: App.field,
                                        size: 28,
                                      ),
                                      onTap: () {
                                        homeController.searchIcon.value = !homeController.searchIcon.value;
                                      },
                                    ) :
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            height: 45,
                                            child: TextField(
                                              textAlignVertical: TextAlignVertical.bottom,
                                              controller: homeController.search,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: CommonTextStyle.mediumTextStyle
                                              ),
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                fillColor: App.field,
                                                filled: true,
                                                hintText: "Search",
                                                hintStyle: TextStyle(color: Colors.grey, fontSize: CommonTextStyle.mediumTextStyle),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                  borderSide: BorderSide(color: Colors.white),),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: App.orange),
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.search,
                                              color: App.field,
                                              size: 28,
                                            ),
                                            onTap: () {
                                              homeController.searchIcon.value = !homeController.searchIcon.value;
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      width:App.getDeviceWidthPercent(60, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              App.lunchURL(context,"https://www.instagram.com/accounts/login/?next=/luxurycarrental_ae/");
                            },
                            child: SvgPicture.asset("assets/icons/instagram.svg",width: 18,height: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              App.lunchURL(context, "https://www.facebook.com/luxurycarrental.ae/");
                            },
                            child: SvgPicture.asset("assets/icons/facebook.svg",width: 18,height: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              App.lunchURL(context, "https://twitter.com/luxurycarsdxb");
                            },
                            child: SvgPicture.asset("assets/icons/twitter.svg",width: 16,height: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              App.lunchURL(context, "https://www.youtube.com/channel/UCg8q_8DqhHBeqnkOSscbdUw");
                            },
                            child: SvgPicture.asset("assets/icons/youtube.svg",width: 16,height: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  ///text inside drawer
  static drawerText(HomeController homeController,int index ,BuildContext context,String text,double fontSize,FontWeight fontWeight) {
    return Container(
        width: App.getDeviceWidthPercent(100, context),
        color: homeController.selectNavDrawer.value == index ? App.grey : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
              child: Text(text.toUpperCase(),
                style: TextStyle(
                  color: homeController.selectNavDrawer.value == index ?  App.orange :  Colors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              )
          ),
        )
    );
  }

}