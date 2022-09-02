import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandsController extends GetxController {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  RxList brands = [
    "assets/icons/logo1.svg",
    "assets/icons/logo2.svg",
    "assets/icons/logo1.svg",
    "assets/icons/logo2.svg",
    "assets/icons/logo2.svg",
    "assets/icons/logo1.svg",
    "assets/icons/logo2.svg",
  ].obs;

}