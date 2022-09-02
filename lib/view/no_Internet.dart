import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/helper/api.dart';
import 'package:luxury_version_1/helper/app.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: App.getDeviceWidthPercent(100, context),
          height: App.getDeviceHeightPercent(100, context),
          color: App.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off,color: App.orange,size: 100),
              Container(
                width: App.getDeviceWidthPercent(90, context),
                height: App.getDeviceHeightPercent(10, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text("No Internet Connection",
                          style: TextStyle(
                            fontSize: CommonTextStyle.bigTextStyle,
                            color: App.field,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ),

                  ],
                ),
              ),
              Center(
                  child: Text("please try again",
                    style: TextStyle(
                        fontSize: CommonTextStyle.mediumTextStyle,
                        color: App.field,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  API.checkInternet().then((value) {
                    if (value) {
                      Get.back();
                    }
                  });
                },
                child: Container(
                    width: App.getDeviceWidthPercent(35, context),
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: App.orange
                    ),
                    child: Center(
                      child:  Text("Reload",
                        style: TextStyle(
                            fontSize: CommonTextStyle.smallTextStyle,
                            color: App.field,
                        ),
                      ),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


