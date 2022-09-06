import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  var selectNavDrawer = 0.obs;
  var searchIcon = true.obs;
  var selectAll = true.obs;
  TextEditingController search = TextEditingController();
  var selectSuperCategory = 0.obs;
  var selectCategory = 0.obs;
  CarouselController carouselController = CarouselController();
  var activeIndex = 0.obs;

  ///filter
  RxInt selectRentalModel = 0.obs;
  Rx<RangeLabels> priceLabel = const RangeLabels("AED 0", "AED 2200").obs;
  Rx<double> minPrice= 0.0.obs, maxPrice= 99999999999999999999.0.obs;
  List<int> selectedBrands = <int>[];
  Rx<RangeValues> price = const RangeValues(0, 2200).obs;

  clearFilter(){
    selectRentalModel = 0.obs;
    selectedBrands.clear();
    minPrice.value = 0.0;
    maxPrice.value = 2200.00;
    price.value = const RangeValues(0, 2200);
    priceLabel.value = const RangeLabels("AED 0", "AED 2200");

  }

  void openMap() async {
    String googleUrl = 'https://goo.gl/maps/jXEstan2qA8kfdxF9';
    await launchUrl(Uri.parse(googleUrl));
  }
  setIndex(int selected){
    activeIndex.value=selected;
  }




}