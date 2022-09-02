import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  RxBool nameValidate = false.obs;
  RxBool emailValidate = false.obs;
  RxBool phoneValidate = false.obs;

  send(BuildContext context,String name,String phone,String email) {
    if(name.isEmpty || email.isEmpty || phone.isEmpty) {
      if(name.isEmpty) {
        nameValidate.value= true;
      } else {
        nameValidate.value= false;
      }
      if(email.isEmpty) {
        emailValidate.value= true;
      }else{
        emailValidate.value= false;
      }
      if(phone.isEmpty) {
        phoneValidate.value= true;
      }else{
        phoneValidate.value= false;
      }
    }
    else {

    }
  }

  clearTextField() {
    name.clear();
    email.clear();
    phone.clear();
    message.clear();
    nameValidate = false.obs;
    emailValidate = false.obs;
    phoneValidate = false.obs;
  }
}