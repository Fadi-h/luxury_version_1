import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static String languageCode = "en";

  static Future<String> loadLanguage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String lang=prefs.getString("language")??'default';
      if(lang!="default") {
        languageCode=lang;
      }
      else {
        languageCode="en";
      }
      Get.updateLocale(Locale(languageCode));
      return languageCode;
    }
    catch(e) {
      return "en";
    }
  }
  static saveLanguage(BuildContext context,String lang) {
    SharedPreferences.getInstance().then((preference) {
      preference.setString("language", lang);
      languageCode=lang;
      MyApp.setLocale(context, Locale(lang));
      Get.updateLocale(Locale(lang));
    });
  }
  static changeLanguage(BuildContext context, String lang) {
    Global.languageCode = lang;
    Locale locale = Locale(lang);
    MyApp.setLocale(context, locale);
    saveLanguage(context,lang);
  }
}