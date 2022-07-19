import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/app.dart';

class Home extends StatelessWidget {

  Home({Key? key}) : super(key: key){
    homeController.selectNavDrawer.value = 0;
  }

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: homeController.key,
        drawer: App.drawer(context,homeController),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: App.primary,
                  child: home(context)
              ),
            ),
            Positioned(
              left: 40,
              bottom: 70,
              child: GestureDetector(
                onTap: () {
                  App.lunchURL(context, Uri.parse("https://api.whatsapp.com/send?phone=+971553451555&text="));
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/whatsapp.svg',width: 40,height: 40,)),
                ),
              ),
            ),
          ],
        )
    ));
  }
  home(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              superCategory(context),
              category(context),
              SizedBox(height: 20,),
              products(context),
              SizedBox(height: 20),
              App.footer(context,homeController)
            ],
          ),
        ),
        Positioned(child: App.header(context,homeController,homeController.key))
      ],
    );
  }

  superCategory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ListView.builder(
              itemCount: homeController.superCategory.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: homeController.selectSuperCategory.value == index ?
                              App.orange : App.button,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(homeController.superCategory[index]["image"],
                              color: homeController.selectSuperCategory.value == index ?
                                App.field : App.orange,
                                fit: BoxFit.cover,
                                width: 40,height: 40,
                              ),
                              SizedBox(width: 5),
                              App.text(context,homeController.superCategory[index]["name"],
                                  20, FontWeight.normal, App.field)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              })
      ),
    );
  }
  category(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ListView.builder(
            itemCount: homeController.category.length,
            shrinkWrap: true,
            controller: homeController.scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  homeController.selectCategory.value = index;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: homeController.selectCategory.value == index ?
                            App.orange : App.button,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: App.text(context,homeController.category[index],
                              20, FontWeight.normal, App.field),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            })
    );
  }
  products(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: homeController.category.length,
            shrinkWrap: true,
            controller: homeController.scrollController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  homeController.selectCategory.value = index;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: homeController.selectCategory.value == index ?
                            App.orange : App.button,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: App.text(context,homeController.category[index],
                              20, FontWeight.normal, App.field),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            })
    );
  }
}
