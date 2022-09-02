import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/api.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/model/all-cars.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:luxury_version_1/view/home.dart';
import 'package:luxury_version_1/view/no_Internet.dart';
import 'package:luxury_version_1/view/product_details.dart';
import 'package:luxury_version_1/view/searchDelgate.dart';


class IntroductionController extends GetxController{

  final ScrollController scrollController = ScrollController(initialScrollOffset: 50.0);
  HomeController homeController = Get.put(HomeController());
  HomeData? homeData;
  AllCars? allCars;
  RxBool loading = false.obs;

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
             homeData = value;
             Get.offAll(() => Home(homeData!,allCars!));
           }
         });
       }else {
         Get.to(() => NoInternet())!.then((value) {
           getData();
         });
       }
    });
  }

  pressedOnSearch(BuildContext context) async {
    final result = await showSearch(
        context: context,
        delegate: SearchTextField(introController: this));
  }

  getCarsById(BuildContext context,index) async{
    API.checkInternet().then((internet){
      loading.value = true;
      if(internet){
        homeController.selectCategory.value = index;
        homeController.selectAll.value = false;
        API.filter("","0","","",[],homeData!.data!.carBody[homeController.selectCategory.value].id.toString()).then((value) {
          if(value != null) {
            loading.value = false;
            allCars = value;
            print(allCars!.data!.cars.length);
          }
          else {
            App.errorTopBar(context, "No Cars in this category");
          }
        });
      }else {
        Get.to(()=>NoInternet())!.then((value) {
          getCarsById(context,index);
        });
      }
    });
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

}