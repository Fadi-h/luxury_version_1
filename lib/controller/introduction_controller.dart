import 'package:get/get.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/helper/global.dart';

class IntroductionController extends GetxController{

  HomeController homeController = Get.put(HomeController());

  @override
  void onInit(){
    super.onInit();
    if(Global.langCode == "en"){
      homeController.selectedLanguage.value = 0;
    }else{
      homeController.selectedLanguage.value = 1;
    }
  }



}