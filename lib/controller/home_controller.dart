import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {

  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  var selectNavDrawer = 0.obs;
  String languageValue = "non";
  var selectedLanguage = 0.obs;
  RxList languages = [
    { "name" : "English", "id" : "en" },
    { "name" : "العربية", "id" : "ar" }
  ].obs;
  var searchIcon = true.obs;
  TextEditingController search = TextEditingController();
  RxList topBrand = ["Lamborghini","Audi","Ferrari","Mercedes",
    "Rolls Royce","Mini Cooper","Bmw","Mclaren","Ford","Chevrolet"].obs;

  RxList superCategory = [
    { "name" : "cars", "image" : "assets/images/car.png"},
    { "name" : "yachts", "image" : "assets/images/yachts.png"},
    { "name" : "jet ski", "image" : "assets/images/ski.png"},
  ].obs;
  var selectSuperCategory = 0.obs;

  RxList category = ["Sport","luxury","SUV","Economy","Family"].obs;
  var selectCategory = 0.obs;

  RxList products = [
    { "name" : "Rolls Royce Wraith", "image" : "assets/images/car1.webp","logo" : "assets/icons/logo1.svg"},
    { "name" : "Mini cooper", "image" : "assets/images/car2.webp","logo": "assets/icons/logo2.svg"},
  ].obs;

  void openMap() async {
    String googleUrl = 'https://goo.gl/maps/jXEstan2qA8kfdxF9';
    await launchUrl(Uri.parse(googleUrl));
  }

}