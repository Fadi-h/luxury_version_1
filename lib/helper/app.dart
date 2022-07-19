import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/app_localization.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/global.dart';
import 'package:luxury_version_1/view/drawer/FAQ.dart';
import 'package:luxury_version_1/view/drawer/about_us.dart';
import 'package:luxury_version_1/view/drawer/blog.dart';
import 'package:luxury_version_1/view/drawer/brand.dart';
import 'package:luxury_version_1/view/drawer/contact_us.dart';
import 'package:luxury_version_1/view/drawer/rent_terms.dart';
import 'package:luxury_version_1/view/introduction.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class App{

  static Color field = const Color(0XFFd6d8d9);
  static Color primary = const Color(0XFF1e1f21);
  static Color button = const Color(0XFF333436);
  static Color orange = const Color(0XFFd5a054);

  ///url
  static void lunchURL(BuildContext context,Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : errorTopBar(context, "something_wrong");
  }
  ///top bar message
  static errorTopBar(BuildContext context,String msg) {
    return showTopSnackBar(context,
    CustomSnackBar.error(
        message: App_Localization.of(context).translate(msg),
    ));
  }
  static successTopBar(BuildContext context,String msg) {
    return showTopSnackBar(context,
        CustomSnackBar.error(
          message: App_Localization.of(context).translate(msg),
          backgroundColor: orange,
        ));
  }
  ///header
  static header(BuildContext context,HomeController homeController,GlobalKey<ScaffoldState> key) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/top-nav.png"),
              fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                key.currentState!.openDrawer();
                },
              child: Icon(Icons.menu,size: 45,color: App.orange),
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(() => Introduction());
              },
              child: Container(
                child: SvgPicture.asset("assets/icons/logo.svg",
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //todo filter
              },
              child: Container(
                child: SvgPicture.asset("assets/icons/filter.svg",
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  ///text inside app
  static text(BuildContext context,String text,double fontSize,FontWeight fontWeight,Color color) {
    return Text(text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
  ///text inside drawer
  static drawerText(HomeController homeController,int index ,BuildContext context,String text,double fontSize,FontWeight fontWeight) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: homeController.selectNavDrawer.value == index ? button : Colors.transparent,
        child: Center(
          child: Text(App_Localization.of(context).translate(text).toUpperCase(),
          style: TextStyle(
            color: homeController.selectNavDrawer.value == index ? orange : field,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        )
        )
    );
  }
  ///drawer
  static drawer(BuildContext context,HomeController homeController) {
    return Obx(() => Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/nav-bg.webp",),
                  fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          homeController.searchIcon.value = true;
                          homeController.search.clear();
                        },
                        child: Container(
                          child: SvgPicture.asset(
                            Global.langCode == "en" ?
                            "assets/icons/back-icon.svg" :
                            "assets/icons/back-icon_arabic.svg",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          child: SvgPicture.asset("assets/icons/logo.svg",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 0;
                        Get.offAll(() => Introduction());
                      },
                      child: drawerText(homeController, 0, context, "home", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 1;
                        Get.to(() => AboutUs());
                        },
                      child: drawerText(homeController, 1, context, "about_us", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 3;
                        Get.to(() => Brand());
                      },
                      child: drawerText(homeController, 3, context, "brands", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 4;
                        Get.to(() => RentTerms());
                      },
                      child: drawerText(homeController, 4, context, "rent_terms", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 5;
                        Get.to(() => FAQ());
                      },
                      child: drawerText(homeController, 5, context, "faq", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 6;
                        Get.to(() => Blog());
                      },
                      child: drawerText(homeController, 6, context, "blog", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        homeController.selectNavDrawer.value = 7;
                        Get.to(() => ContactUs());
                      },
                      child: drawerText(homeController, 7, context, "contact_us", 20, FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 70,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.languages.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () {
                              Global.saveLanguage(context,homeController.languages[index]["id"]);
                              homeController.selectedLanguage.value = index;
                              if(homeController.languages[index]["id"] == 'en'){
                                homeController.languageValue = homeController.languages[index]["id"];
                              }else{
                                homeController.languageValue = homeController.languages[index]["id"];
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width  * 0.25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text( homeController.languages[index]["id"] == "en" ?
                                        App_Localization.of(context).translate("en") :
                                        App_Localization.of(context).translate("ar"),
                                          style: TextStyle(
                                            color: homeController.selectedLanguage.value == index ?
                                                orange : field,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ),
                                  ],
                                )
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        AnimatedContainer(
                          duration:
                          Duration(milliseconds: 300),
                          width: homeController.searchIcon.value ? 40
                              : MediaQuery.of(context).size.width * 0.75,
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: homeController.searchIcon.value ?
                                  GestureDetector(
                                    child: Icon(
                                      Icons.search,
                                      color: field,
                                      size: 35,
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
                                          height: 50,
                                          child: TextField(
                                            textAlignVertical: TextAlignVertical.bottom,
                                            controller: homeController.search,
                                            style: TextStyle(color: Colors.grey,fontSize: 20),
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              fillColor: field,
                                              filled: true,
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: const TextStyle(color: Colors.grey,fontSize: 20),
                                              enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                borderSide: BorderSide(color: Colors.white),),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
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
                                            color: field,
                                            size: 35,
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
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              lunchURL(context,Uri.parse("https://www.instagram.com/accounts/login/?next=/luxurycarrental_ae/"));
                            },
                            child: SvgPicture.asset("assets/icons/instagram.svg",width: 25,height: 25),
                          ),
                          GestureDetector(
                            onTap: () {
                              lunchURL(context, Uri.parse("https://www.facebook.com/luxurycarrental.ae/"));
                            },
                            child: SvgPicture.asset("assets/icons/facebook.svg",width: 25,height: 25),
                          ),
                          GestureDetector(
                            onTap: () {
                              lunchURL(context, Uri.parse("https://twitter.com/luxurycarsdxb"));
                            },
                            child: SvgPicture.asset("assets/icons/twitter.svg",width: 23,height: 23),
                          ),
                          GestureDetector(
                            onTap: () {
                              lunchURL(context, Uri.parse("https://www.youtube.com/channel/UCg8q_8DqhHBeqnkOSscbdUw"));
                            },
                            child: SvgPicture.asset("assets/icons/youtube.svg",width: 23,height: 23),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  ///footer
  static footer(BuildContext context,HomeController homeController) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: primary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: SvgPicture.asset("assets/icons/logo.svg"),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      lunchURL(context,Uri.parse("https://www.instagram.com/accounts/login/?next=/luxurycarrental_ae/"));
                    },
                    child: SvgPicture.asset("assets/icons/instagram.svg",width: 30,height: 30),
                  ),
                  GestureDetector(
                    onTap: () {
                      lunchURL(context, Uri.parse("https://www.facebook.com/luxurycarrental.ae/"));
                    },
                    child: SvgPicture.asset("assets/icons/facebook.svg",width: 30,height: 30),
                  ),
                  GestureDetector(
                    onTap: () {
                      lunchURL(context, Uri.parse("https://twitter.com/luxurycarsdxb"));
                    },
                    child: SvgPicture.asset("assets/icons/twitter.svg",width: 28,height: 28),
                  ),
                  GestureDetector(
                    onTap: () {
                      lunchURL(context, Uri.parse("https://www.youtube.com/channel/UCg8q_8DqhHBeqnkOSscbdUw"));
                    },
                    child: SvgPicture.asset("assets/icons/youtube.svg",width: 28,height: 28),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 70,
              child: text(context,App_Localization.of(context).translate("top_brand").toUpperCase(), 25, FontWeight.bold, orange),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.28,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0
                  ),
                  itemCount: homeController.topBrand.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) {
                    return text(context,homeController.topBrand[index],
                        20, FontWeight.normal, field);
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_rounded,color: field,size: 35),
                      GestureDetector(
                        onTap: () {
                          homeController.openMap();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: text(context,"Ground Floor, Shop # 9 Mercure Hotel Suites Apartment Sheikh Zayed Road Dubai - UAE",
                              20, FontWeight.normal, orange),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.call,color: field,size: 35),
                      GestureDetector(
                        onTap: () {
                          lunchURL(context,Uri.parse("+971 4 392 7704"));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: text(context,"+971 4 392 7704",
                              20, FontWeight.normal, orange),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/whatsapp.svg",
                        width: 35,height: 35),
                      GestureDetector(
                        onTap: () {
                          lunchURL(context,Uri.parse("https://api.whatsapp.com/send?phone=+971553451555&text="));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: text(context,"+971 55 345 1555",
                              20, FontWeight.normal, orange),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/footer.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Divider(
                height: 2,
                thickness: 2,
                color: field,
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: text(context,"2021 ©luxury Rental Car",
                  20, FontWeight.normal, field),
            ),
          ],
        ),
      ),
    );
  }
}