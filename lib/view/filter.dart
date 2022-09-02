import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/custom_button.dart';

class Filter extends StatelessWidget {

  Filter();

  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: App.getDeviceWidthPercent(100, context),
      child: Drawer(
        child: Container(
          width: App.getDeviceWidthPercent(100, context),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/nav-bg.webp",),
                  fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
                ///header
                _header(context),
                ///Image
                ContainerWithImage(
                    width: App.getDeviceWidthPercent(100, context),
                    height: App.getDeviceHeightPercent(25, context),
                    image: "assets/images/ad.webp",
                    option: 1
                ),
                const SizedBox(height: 20),
                ///Rental Model
                _rentalModel(context),
                const SizedBox(height: 35),
                ///Price,
                _price(context),
                const SizedBox(height: 20),
                ///Brands
                _brands(context),
                const SizedBox(height: 40),
                _applyButton(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _header(BuildContext context) {
    return Padding(
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
                height: 30,
                color: Colors.transparent,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeController.clearFilter();
            },
            child: Container(
              child: Row(
                children: const [
                  Text("Clear",
                    style: TextStyle(
                        color: App.field,
                        fontSize: CommonTextStyle.mediumTextStyle
                    ),
                  ),
                  Icon(Icons.delete,color: App.field,size: 23,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _rentalModel(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(90, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Rental Model",
            style: CommonTextStyle.textStyleForLargeWhiteBold,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      homeController.selectRentalModel.value = 0;
                    },
                    child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Center(
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: homeController.selectRentalModel.value == 0 ? Colors.white : Colors.transparent
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Per Day",
                    style: CommonTextStyle.textStyleForMediumWhiteNormal,
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      homeController.selectRentalModel.value = 1;
                    },
                    child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Center(
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: homeController.selectRentalModel.value != 0 ? Colors.white : Colors.transparent
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Per Hour",
                    style: CommonTextStyle.textStyleForMediumWhiteNormal,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  _price(BuildContext context) {
    return AnimatedContainer(
      width: App.getDeviceWidthPercent(95, context),
      duration: const Duration(milliseconds: 300),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RangeSlider(
                divisions: 22,
                min: 0,
                max: 2200,
                onChanged: (value){
                  homeController.minPrice.value = value.start;
                  homeController.maxPrice.value = value.end;
                  homeController.price.value = value;
                  homeController.priceLabel.value = RangeLabels("AED "+value.start.toStringAsFixed(2), "AED "+value.end.toStringAsFixed(2));
                },
                values: homeController.price.value,
                labels: homeController.priceLabel.value,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    Center(
                        child: Text("0 AED", style: CommonTextStyle.textStyleForMediumWhiteNormal)
                    ),
                    Center(
                        child: Text("2200 AED", style: CommonTextStyle.textStyleForMediumWhiteNormal)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _brands(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(90, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Brands",
            style: CommonTextStyle.textStyleForLargeWhiteBold,
          ),
          Container(
            width: App.getDeviceWidthPercent(90, context),
            child: GridView.builder(
              padding: EdgeInsets.only(top: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: introductionController.homeData!.data!.brands.length,
              itemBuilder: (context, index){
                return Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        ///select multi items
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: App.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                              introductionController.homeData!.data!.brands[index].name,textAlign: TextAlign.center,
                              style: CommonTextStyle.textStyleForSmallWhiteHalfBold
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
  _applyButton(BuildContext context) {
    return CustomButton(
      width: App.getDeviceWidthPercent(80, context),
      height: 50,
      text: "Apply",
      onPressed: () {
        ///apply
      },
      color: App.orange,
      borderRadius: 20,
      textStyle: CommonTextStyle.textStyleForBigWhiteNormal,
    );
  }
}