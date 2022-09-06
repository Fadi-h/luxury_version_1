import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/api.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/model/about.dart';
import 'package:luxury_version_1/model/all-cars.dart';
import 'package:luxury_version_1/model/blog.dart';
import 'package:luxury_version_1/model/brands.dart';
import 'package:luxury_version_1/model/faq.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:luxury_version_1/model/terms.dart';
import 'package:luxury_version_1/view/cars_by_brand.dart';
import 'package:luxury_version_1/view/home.dart';
import 'package:luxury_version_1/view/no_Internet.dart';
import 'package:luxury_version_1/view/product_details.dart';
import 'package:luxury_version_1/view/searchDelgate.dart';


class IntroductionController extends GetxController{

  final ScrollController scrollController = ScrollController(initialScrollOffset: 50.0);
  HomeController homeController = Get.put(HomeController());
  HomeData? homeData;
  AllCars? allCars;
  AllCars? allCarsConst;
  RxBool loading = false.obs;
  Rx<int> lengthproductList = 6.obs;
  AllBrands ? allBrands;
  RxBool carsLoading = false.obs;
  RxInt selectBrand = 0.obs;
  AboutUs? aboutUs;
  RentTerms? terms;
  Faq? faq;
  BLOG? blogs;

  @override
  void onInit(){
    super.onInit();
    getData();
  }

  getData() async {
    API.checkInternet().then((internet) async {
       if(internet) {
         API.getHome().then((value) async{
           if(value != null) {
             allCars = await API.getAllCars();
             allCarsConst = await API.getAllCars();
             homeData = value;
             Get.offAll(() => Home(homeData!));
           }
         });
         API.getAboutUs().then((value) {
           if(value != null) {
             aboutUs = value;
           }
         });
         API.getTerms().then((value) {
           if(value != null) {
             terms = value;
           }
         });
         API.getFAQ().then((value) {
           if(value != null) {
             faq = value;
           }
         });
         API.getBlogs().then((value) {
           if(value != null) {
             blogs = value;
           }
         });
       }else {
         Get.to(() => NoInternet())!.then((value) {
           getData();
         });
       }
    });
  }
  viewAllProducts() {
    if(lengthproductList.value + 6 > allCars!.data!.cars.length){
      lengthproductList.value =  allCars!.data!.cars.length;
    }else{
      lengthproductList.value = lengthproductList.value+6;
    }
  }
  initProductCount() {
    if(allCars!.data!.cars.length > 6){
      lengthproductList.value = 6;
    }else{
      lengthproductList.value = allCars!.data!.cars.length;
    }
    // print(lengthproductList.value);
    // print("lengthproductList.value");
    // print(allCarsConst!.data!.cars.length);
  }
  getCarsById(BuildContext context,index) async{
    API.checkInternet().then((internet){
      loading.value = true;
      if(internet){
        homeController.selectCategory.value = index;
        homeController.selectAll.value = false;
        API.filter("","0","","",[],homeData!.data!.carBody[homeController.selectCategory.value].id.toString()).then((value) {
          if(value != null) {
            allCars = value;
            initProductCount();
            loading.value = false;
            // print(allCars!.data!.cars.length);
          }
        });
      }else {
        Get.to(()=>NoInternet())!.then((value) {
          getCarsById(context,index);
        });
      }
    });
  }
  pressedOnSearch(BuildContext context) async {
    final result = await showSearch(
        context: context,
        delegate: SearchTextField(introController: this));
  }
  search(BuildContext context,String query,int index){
    if(query.isNotEmpty){
      API.search(query).then((value) {
        if(value != null){
          Get.to(()=>ProductDetails(allCars!.data!.cars[index].id));
        }
      });
    }
  }
  carsByBrand(BuildContext context,int carId,int index){
    carsLoading.value = true;
    API.getCarsByBrand(carId).then((value) {
      carsLoading.value = false;
      if(value != null){
        allBrands = value;
        Get.to(() => CarsByBrand(allBrands!,index));
      }else{
        App.errorTopBar(context, "This brand has no cars");
      }
    });
  }
}