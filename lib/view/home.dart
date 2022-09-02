import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/api.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/model/all-cars.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:luxury_version_1/view/drawer/FAQ.dart';
import 'package:luxury_version_1/view/drawer/about_us.dart';
import 'package:luxury_version_1/view/drawer/blog.dart';
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
import 'package:luxury_version_1/widgets/title_and_description.dart';
import 'package:url_launcher/url_launcher.dart';



class Home extends StatelessWidget {

  HomeData homeData;
  AllCars allCars;
  HomeController homeController = Get.put(HomeController());
  IntroductionController introductionController = Get.find();

  Home(this.homeData, this.allCars) {
    homeController.selectNavDrawer.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: homeController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Stack(
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
              left: 30,
              bottom: 30,
              child: GestureDetector(
                onTap: () {
                  App.lunchURL(context, "https://api.whatsapp.com/send?phone=+971553451555&text=");
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
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
            ),
          ],
        )
    ));
  }

  home(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top,),
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
                  option: 0
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              introductionController.pressedOnSearch(context);
            },
            child: Container(
              width: App.getDeviceWidthPercent(90, context),
              height: 40,
              decoration: BoxDecoration(
                color: App.grey,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(Icons.search,color: App.lightGrey,size: 23),
                    ),
                    SizedBox(width: 5,),
                    Text("CHOOSE YOUR DREAM CAR",
                      style: TextStyle(
                        color: App.lightGrey,
                        fontSize: CommonTextStyle.smallTextStyle
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
          SizedBox(height: 15),
          superCategory(context,homeData, homeController.selectSuperCategory.value),
          SizedBox(height: 15),
          homeData.data!.carType[homeController.selectSuperCategory.value].id !=
              allCars.data!.cars[homeController.selectSuperCategory.value].typeId ?
          Column(
            children: [
              SizedBox(height: 5),
              Container(
                  width: App.getDeviceWidthPercent(50, context),
                  height: 40,
                  decoration: BoxDecoration(
                      color: App.field,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Text("No Result Found!",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: CommonTextStyle.mediumTextStyle
                          )
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 20,),
              TitleAndDescription(
                text1: "LUXURY RENTAL CAR",
                text2: "Live Your Life Luxuriously And Elegantly! Take A Graceful Drive With A Professional Driver From Our Chauffeur Services In DubaiFor Comfort And Ease.",
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
                width2: 90,
              ),
              SizedBox(height: 20,),
              Container(
                width: App.getDeviceWidthPercent(90, context),
                height: App.getDeviceHeightPercent(28, context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/chauffeur.webp"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 20,),
              TitleAndDescription(
                text1: "WHY OUR LUXURY CHAUFFEUR SERVICE?",
                text2: "Let Go Of The Wheel And Have Your Troubles Fade Away As A Chauffeur Takes Over Your Drive. Whether You're Going To A Business Meeting, A Late Dinner Party, Or Picking Up A Friend, We Can Make It Easy For You. Have Our Professional Take You Where You Want To Go In The Dream Car Of Your Choice.",
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
                width2: 90,
              ),
            ],
          ) : category(context),
          introductionController.loading.value ?
          Container(
            width: App.getDeviceWidthPercent(100, context),
            height: App.getDeviceHeightPercent(50, context),
            color: App.darkGrey,
            child: Center(
              child: CircularProgressIndicator(color: App.orange,),
            ),
          ) :
          homeData.data!.carType[homeController.selectSuperCategory.value].id !=
              allCars.data!.cars[homeController.selectSuperCategory.value].typeId ? Center() :
          products(context),
          SizedBox(height: 20),
          Footer(introductionController: introductionController)
        ],
      ),
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                              SizedBox(width: 5),
                              TextApp(text: homeData.data!.carType[index].nameEn,
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
              API.getAllCars().then((value) {
                introductionController.loading.value = false;
                if(value != null) {
                  print(value.data!.cars.length);
                }
              });
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
                    child: TextApp(text: "All",
                        textStyle: CommonTextStyle.textStyleForMediumWhiteHalfBold
                    ),
                  ),
                ),
                Container(
                    child: ListView.builder(
                        itemCount: homeData.data!.carBody.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                                      child: TextApp(text: homeData.data!.carBody[index].nameEn,
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
    return Container(
        width: App.getDeviceWidthPercent(92, context),
        child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: allCars.data!.cars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 6/5,
                crossAxisSpacing: 10,
                crossAxisCount: 1
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(()=>ProductDetails(allCars.data!.cars[index].id));
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
                                    child: SvgPicture.network(API.url + "/" + allCars.data!.cars[index].brands!.img),
                                  ),
                                )
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 1,
                          child: TextApp(
                              text: allCars.data!.cars[index].slug,
                              textStyle: CommonTextStyle.textStyleForBigOrangeBold
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              allCars.data!.cars[index].hourlyPrice == -1 ?
                              Center() :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      TextApp(
                                          text: " AED " +  allCars.data!.cars[index].hourlyPrice.toString(),
                                          textStyle: CommonTextStyle.textStyleForMediumWhiteNormal
                                      ),
                                      Text(" Hourly",
                                        style: TextStyle(
                                            color: App.lightGrey,
                                            fontSize: CommonTextStyle.mediumTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: allCars.data!.cars[index].oldHourlyPrice == 0 ? 0 : 5),
                                  allCars.data!.cars[index].oldHourlyPrice == 0 ?
                                  Center() :
                                  Row(
                                    children: [
                                      TextApp(
                                        text: " AED " + allCars.data!.cars[index].oldHourlyPrice.toString(),
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          color: App.lightGrey,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      TextApp(
                                        text: ((100 - (allCars.data!.cars[index].hourlyPrice * 100)/allCars.data!.cars[index].oldHourlyPrice).round().toString()) + " % " +" OFF",
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
                              allCars.data!.cars[index].hourlyPrice == -1 ||  allCars.data!.cars[index].dailyPrice == -1 ?
                              Center() :
                              VerticalDivider(
                                color: App.orange,
                                thickness: 1,
                                endIndent: allCars.data!.cars[index].oldHourlyPrice != 0 ? 8 : 12,
                                indent: allCars.data!.cars[index].oldHourlyPrice != 0 ? 8 : 12,
                              ),
                              allCars.data!.cars[index].dailyPrice == -1 ?
                              Center() :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      TextApp(
                                          text: " AED " + allCars.data!.cars[index].dailyPrice.toString(),
                                          textStyle: CommonTextStyle.textStyleForMediumWhiteNormal
                                      ),
                                      Text(" Day",
                                        style: TextStyle(
                                            color: App.lightGrey,
                                            fontSize: CommonTextStyle.mediumTextStyle,
                                            fontStyle: FontStyle.italic
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: allCars.data!.cars[index].oldDailyPrice == 0 ? 0 : 5),
                                  allCars.data!.cars[index].oldDailyPrice == 0 ?
                                  Center() :
                                  Row(
                                    children: [
                                      TextApp(
                                        text: " AED " + allCars.data!.cars[index].oldDailyPrice.toString(),
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          color: App.lightGrey,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      TextApp(
                                        text: ((100 - (allCars.data!.cars[index].dailyPrice * 100)/allCars.data!.cars[index].oldDailyPrice).round().toString()) + " % " +" OFF",
                                        textStyle: TextStyle(
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
                                          text: "Whatsapp",
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
                                    decoration: BoxDecoration(
                                      color: App.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: Icon(Icons.call,color: Colors.red,size: 14,),
                                          text: "Call",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>ProductDetails(allCars.data!.cars[index].id));
                                  homeController.selectNavDrawer.value = 0;
                                },
                                child: Container(
                                    width: App.getDeviceWidthPercent(92, context) / 5,
                                    decoration: BoxDecoration(
                                      color: App.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ImageAndText(
                                          child1: Icon(Icons.info_outline,color: Colors.orange,size: 14,),
                                          text: "Details",
                                          textStyle:  CommonTextStyle.textStyleForTinyWhiteNormal
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ///book page
                                },
                                child: Container(
                                    width: App.getDeviceWidthPercent(92, context) / 4,
                                    decoration: BoxDecoration(
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
                                          text: "Book",
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
            itemCount: allCars.data!.cars[index].imgs.split(",").length,
            itemBuilder: (BuildContext context, int photoIndex, int realIndex) {
              return Container(
                width: App.getDeviceWidthPercent(100, context),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(API.url + "/" + allCars.data!.cars[index].imgs.split(",")[photoIndex]),
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
  
