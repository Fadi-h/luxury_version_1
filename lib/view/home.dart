import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/app_localization.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/api.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/helper/global.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:luxury_version_1/view/book.dart';
import 'package:luxury_version_1/view/drawer/FAQ.dart';
import 'package:luxury_version_1/view/drawer/about_us.dart';
import 'package:luxury_version_1/view/drawer/BLOG.dart';
import 'package:luxury_version_1/view/drawer/brandPage.dart';
import 'package:luxury_version_1/view/drawer/contact_us.dart';
import 'package:luxury_version_1/view/drawer/rent_terms.dart';
import 'package:luxury_version_1/view/filter.dart';
import 'package:luxury_version_1/view/product_details.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/header.dart';
import 'package:luxury_version_1/widgets/image_and_text.dart';
import 'package:luxury_version_1/widgets/text_app.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {

  HomeData homeData;
  HomeController homeController = Get.put(HomeController());
  IntroductionController introductionController = Get.find();

  Home(this.homeData) {
    homeController.selectNavDrawer.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: App.darkGrey,
        key: homeController.key,
        floatingActionButtonLocation:
        FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            App.lunchURL(context, "https://api.whatsapp.com/send?phone=+971553451555&text=");
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            child: Center(
              child: ContainerWithImage(
                  width: 30,
                  height: 30,
                  image: "assets/icons/whatsapp.svg",
                  option: 0
              ),
            ),
          ),
        ),
        drawer: CustomDrawer(homeController: homeController),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: App.getDeviceWidthPercent(100, context),
                height: App.getDeviceHeightPercent(100, context),
                color: App.darkGrey,
              ),
              homeController.selectNavDrawer.value == 0 ?
              home(context) : homeController.selectNavDrawer.value == 1 ? AboutUs() :
              homeController.selectNavDrawer.value == 2 ? BrandPage() : homeController.selectNavDrawer.value == 3 ? RentTerms() :
              homeController.selectNavDrawer.value == 4 ? FAQ() : homeController.selectNavDrawer.value == 5 ? Blog()  :
              homeController.selectNavDrawer.value == 6 ? ContactUs() : home(context),
              Positioned(
               child: Column(
                 children: [
                   Header(
                     homeController: homeController,
                     onTap: () {
                       homeController.key.currentState!.openDrawer();
                     },
                     child: GestureDetector(
                       onTap: () {
                         Navigator.of(context).push(PageRouteBuilder(
                           pageBuilder: (context, animation, secondaryAnimation) => Filter(),
                           transitionsBuilder: (context, animation, secondaryAnimation, child) {
                             const begin = Offset(1.0,0.0);
                             const end = Offset.zero;
                             const curve = Curves.easeInOut;
                             var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                             return SlideTransition(
                               position: animation.drive(tween),
                               child: child,
                             );
                           },
                         ));
                       },
                       child: ContainerWithImage(
                         width: 30,
                         height: 30,
                         image: "assets/icons/filter.svg",
                         option: 0,
                         color: Colors.transparent,
                       ),
                     ),
                   ),
                 ],
               )
              ),
              introductionController.carsLoading.value ?
              Container(
                width: App.getDeviceWidthPercent(100, context),
                height: App.getDeviceHeightPercent(100, context),
                color: App.darkGrey,
                child: const Center(
                  child: CircularProgressIndicator(color: App.orange,),
                ),
              ) : const Center(),
            ],
          ),
        )
    ));
  }

  home(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 85),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Filter(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0,0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child: Container(
                    width: App.getDeviceWidthPercent(85, context),
                    height: 45,
                    decoration: BoxDecoration(
                        color: App.grey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(Icons.filter_alt_rounded,color: App.orange,size: 23),
                          ),
                          const SizedBox(width: 5,),
                          Text(App_Localization.of(context).translate("filter"),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: CommonTextStyle.mediumTextStyle
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
              const SizedBox(height: 15),
              superCategory(context,homeData, homeController.selectSuperCategory.value),
              const SizedBox(height: 15),
              homeData.data!.carType[homeController.selectSuperCategory.value].id !=3?
              Column(
                children: [
                  Container(
                    width: App.getDeviceWidthPercent(50, context),
                    height: 40,
                    decoration: BoxDecoration(
                        color: App.field,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text(App_Localization.of(context).translate("no_results_found!"),
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: CommonTextStyle.mediumTextStyle
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: App.getDeviceWidthPercent(90, context),
                        child: const Text("LUXURY RENTAL CAR",
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
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: App.getDeviceWidthPercent(90, context),
                        child: const Text("Live Your Life Luxuriously And Elegantly! Take A Graceful Drive With A Professional Driver From Our Chauffeur Services In DubaiFor Comfort And Ease.",
                          style: TextStyle(
                              letterSpacing: 0.3,
                              height: 1.3,
                              fontSize: CommonTextStyle.smallTextStyle,
                              color: App.lightGrey,
                              fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: App.getDeviceWidthPercent(90, context),
                    height: App.getDeviceHeightPercent(28, context),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/chauffeur.webp"),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: App.getDeviceWidthPercent(90, context),
                        child: const Text("WHY OUR LUXURY CHAUFFEUR SERVICE?",
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
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: App.getDeviceWidthPercent(90, context),
                        child: const Text("Let Go Of The Wheel And Have Your Troubles Fade Away As A Chauffeur Takes Over Your Drive. Whether You're Going To A Business Meeting, A Late Dinner Party, Or Picking Up A Friend, We Can Make It Easy For You. Have Our Professional Take You Where You Want To Go In The Dream Car Of Your Choice.",
                          style: TextStyle(
                              letterSpacing: 0.3,
                              height: 1.3,
                              fontSize: CommonTextStyle.smallTextStyle,
                              color: App.lightGrey,
                              fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                ],
              ) : category(context),
              introductionController.loading.value ?
              Container(
                width: App.getDeviceWidthPercent(100, context),
                height: App.getDeviceHeightPercent(50, context),
                color: App.darkGrey,
                child: const Center(
                  child: CircularProgressIndicator(color: App.orange,),
                ),
              ) :
              homeData.data!.carType[homeController.selectSuperCategory.value].id !=
                  3 ? const Center() :
              products(context),
              homeData.data!.carType[homeController.selectSuperCategory.value].id !=
                  3 ? const Center() : (introductionController.lengthproductList.value == introductionController.allCars!.data!.cars.length)
                  || introductionController.loading.value == true
                  ? const Center() :
              GestureDetector(
                  onTap: () {
                    introductionController.viewAllProducts();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: App.getDeviceWidthPercent(40, context),
                        height: 35,
                        decoration: BoxDecoration(
                            color: App.field,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                            child: Text(App_Localization.of(context).translate("see_more"),
                                style: const TextStyle(
                                  color: App.orange,
                                  fontSize: CommonTextStyle.mediumTextStyle,
                                  fontWeight: FontWeight.bold,
                                )
                            )
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 20),
              Footer(introductionController: introductionController)
            ],
          ),
        )
      ],
    );
  }
  superCategory(BuildContext context,HomeData homeData,int index) {
    return Container(
        height: 45,
        child: ListView.builder(
            itemCount: homeData.data!.carType.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  homeController.selectSuperCategory.value = index;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: homeController.selectSuperCategory.value == index ?
                              App.orange : App.grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.network(API.url + "/" + homeData.data!.carType[index].img,
                                      fit: BoxFit.cover,
                                      color: homeController.selectSuperCategory.value == index ? Colors.black : App.orange,
                                  )
                              ),
                              const SizedBox(width: 5),
                              TextApp(text:
                                  Global.languageCode == "en" ?
                              homeData.data!.carType[index].nameEn :
                              homeData.data!.carType[index].nameAr,
                                  textStyle: TextStyle(
                                      fontSize: CommonTextStyle.xSmallTextStyle,
                                      color:  homeController.selectSuperCategory.value == index ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.normal
                                  )
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ));
            })
    );
  }
  category(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context,int index) {
          return Obx(() => GestureDetector(
            onTap: () {
              homeController.selectCategory.value = index;
              homeController.selectAll.value = true;
              introductionController.loading.value = true;
              introductionController.allCars = introductionController.allCarsConst;
              Future.delayed(const Duration(seconds: 1)).then((value) {
                introductionController.loading.value = false;
              });
              introductionController.initProductCount();
              },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        color: homeController.selectCategory.value == 0 && homeController.selectAll.value == true ?
                        App.orange : App.grey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: TextApp(text: App_Localization.of(context).translate("all").toUpperCase(),
                        textStyle: CommonTextStyle.textStyleForMediumWhiteHalfBold
                    ),
                  ),
                ),
                Container(
                    child: ListView.builder(
                        itemCount: homeData.data!.carBody.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(() => GestureDetector(
                            onTap: () {
                              introductionController.getCarsById(context, index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: homeController.selectCategory.value == index && homeController.selectAll.value  == false?
                                        App.orange : App.grey,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: TextApp(text:
                                      Global.languageCode == "en" ?
                                      homeData.data!.carBody[index].nameEn :
                                      homeData.data!.carBody[index].nameAr,
                                          textStyle: CommonTextStyle.textStyleForMediumWhiteHalfBold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                        })
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
  products(BuildContext context) {
    return introductionController.allCars!.data!.cars.isEmpty ?
       Column(
         children: [
           const SizedBox(height: 15,),
           Container(
             width: App.getDeviceWidthPercent(50, context),
             height: 40,
             decoration: BoxDecoration(
                 color: App.field,
                 borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: [
                 const SizedBox(width: 10,),
                 Text(App_Localization.of(context).translate("no_results_found!"),
                     style: TextStyle(
                         color: Colors.grey[600],
                         fontSize: CommonTextStyle.mediumTextStyle
                     )
                 ),
               ],
             ),
           ),
         ],
       ) :
      Container(
        width: App.getDeviceWidthPercent(92, context),
        child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: introductionController.lengthproductList.value,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 6/5,
                crossAxisSpacing: 10,
                crossAxisCount: 1
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(()=>ProductDetails(introductionController.allCars!.data!.cars[index].id));
                  homeController.selectNavDrawer.value = 0;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: App.getDeviceWidthPercent(92, context),
                    decoration: BoxDecoration(
                        color: App.lightDarkGrey,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Stack(
                              children: [
                                productImages(context,index),
                                Positioned(
                                  left: 15,
                                  top: 15,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    //todo uncomment
                                    // child: SvgPicture.network(API.url + "/" + introductionController.allCars!.data!.cars[index].brands!.img),
                                  ),
                                )
                              ],
                            )
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                          flex: 1,
                          child: TextApp(
                              text: introductionController.allCars!.data!.cars[index].slug,
                              textStyle: CommonTextStyle.textStyleForBigOrangeBold
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              introductionController.allCars!.data!.cars[index].hourlyPrice == -1 ?
                              const Center() :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      TextApp(
                                          text: " AED " +  introductionController.allCars!.data!.cars[index].hourlyPrice.toString(),
                                          textStyle: CommonTextStyle.textStyleForMediumWhiteNormal
                                      ),
                                      Text(" "+App_Localization.of(context).translate("hour"),
                                        style: const TextStyle(
                                            color: App.lightGrey,
                                            fontSize: CommonTextStyle.mediumTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: introductionController.allCars!.data!.cars[index].oldHourlyPrice == 0 ? 0 : 5),
                                  introductionController.allCars!.data!.cars[index].oldHourlyPrice == 0 ?
                                  const Center() :
                                  Row(
                                    children: [
                                      TextApp(
                                        text: " AED " + introductionController.allCars!.data!.cars[index].oldHourlyPrice.toString(),
                                        textStyle: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          color: App.lightGrey,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      TextApp(
                                        text: ((100 - (introductionController.allCars!.data!.cars[index].hourlyPrice * 100)/introductionController.allCars!.data!.cars[index].oldHourlyPrice).round().toString()) + " % " +" OFF",
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: CommonTextStyle.smallTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              introductionController.allCars!.data!.cars[index].hourlyPrice == -1 ||  introductionController.allCars!.data!.cars[index].dailyPrice == -1 ?
                              const Center() :
                              VerticalDivider(
                                color: App.orange,
                                thickness: 1,
                                endIndent: introductionController.allCars!.data!.cars[index].oldHourlyPrice != 0 ? 8 : 12,
                                indent: introductionController.allCars!.data!.cars[index].oldHourlyPrice != 0 ? 8 : 12,
                              ),
                              introductionController.allCars!.data!.cars[index].dailyPrice == -1 ?
                              const Center() :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      TextApp(
                                          text: " AED " + introductionController.allCars!.data!.cars[index].dailyPrice.toString(),
                                          textStyle: CommonTextStyle.textStyleForMediumWhiteNormal
                                      ),
                                      Text(" "+App_Localization.of(context).translate("day"),
                                        style: const TextStyle(
                                            color: App.lightGrey,
                                            fontSize: CommonTextStyle.mediumTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: introductionController.allCars!.data!.cars[index].oldDailyPrice == 0 ? 0 : 5),
                                  introductionController.allCars!.data!.cars[index].oldDailyPrice == 0 ?
                                  const Center() :
                                  Row(
                                    children: [
                                      TextApp(
                                        text: " AED " + introductionController.allCars!.data!.cars[index].oldDailyPrice.toString(),
                                        textStyle: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          color: App.lightGrey,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      TextApp(
                                        text: ((100 - (introductionController.allCars!.data!.cars[index].dailyPrice * 100)/introductionController.allCars!.data!.cars[index].oldDailyPrice).round().toString()) + " % " +" OFF",
                                        textStyle: const TextStyle(
                                            color: Colors.green,
                                            fontSize: CommonTextStyle.smallTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  App.lunchURL(context,"https://api.whatsapp.com/send?phone=");
                                },
                                child: Container(
                                  width: App.getDeviceWidthPercent(92, context) / 4,
                                    decoration: BoxDecoration(
                                        color: App.grey,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15)
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: Icon(Icons.whatsapp,color: Colors.green,size: 14,),
                                          text: "whatsapp",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () async{
                                  if(await canLaunchUrl(Uri.parse('tel: +971 4 392 7704'))){
                                    await launchUrl (Uri.parse('tel: +971 4 392 7704'));
                                  }
                                },
                                child: Container(
                                    width: App.getDeviceWidthPercent(92, context) / 5,
                                    decoration: const BoxDecoration(
                                      color: App.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: const Icon(Icons.call,color: Colors.red,size: 14,),
                                          text: "call",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>ProductDetails(introductionController.allCars!.data!.cars[index].id));
                                  homeController.selectNavDrawer.value = 0;
                                },
                                child: Container(
                                    width: App.getDeviceWidthPercent(92, context) / 5,
                                    decoration: const BoxDecoration(
                                      color: App.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: const Icon(Icons.info_outline,color: Colors.orange,size: 14,),
                                          text: "detail",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => Book(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(1.0,0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                                child: Container(
                                    width: App.getDeviceWidthPercent(92, context) / 4,
                                    decoration: const BoxDecoration(
                                        color: App.grey,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15)
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: ContainerWithImage(
                                            width: 16,
                                            height: 16,
                                            image: "assets/icons/book.svg",
                                            option: 0,
                                            color: App.orange,
                                          ),
                                          text: "book",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
    );
  }
  productImages(BuildContext context,int index) {
    return Stack(
      children: [
        Container(
          width: App.getDeviceWidthPercent(100, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CarouselSlider.builder(
            carouselController: homeController.carouselController,
            options: CarouselOptions(
                height: App.getDeviceHeightPercent(23, context),
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.setIndex(index);
                }),
            itemCount: introductionController.allCars!.data!.cars[index].imgs.split(",").length,
            itemBuilder: (BuildContext context, int photoIndex, int realIndex) {
              return Container(
                width: App.getDeviceWidthPercent(100, context),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(API.url + "/" + introductionController.allCars!.data!.cars[index].imgs.split(",")[photoIndex]),
                        fit: BoxFit.cover
                    )
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
  
