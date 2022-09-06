import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/app_localization.dart';
import 'package:luxury_version_1/controller/book_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/helper/global.dart';
import 'package:luxury_version_1/widgets/container_with_image.dart';
import 'package:luxury_version_1/widgets/custom_button.dart';
import 'package:luxury_version_1/widgets/text_app.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Book extends StatelessWidget {

  Book();

  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();
  BookController bookController = Get.put(BookController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: Container(
          width: App.getDeviceWidthPercent(100, context),
          height: App.getDeviceHeightPercent(100, context),
          color: App.darkGrey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(context),
                const SizedBox(height: 15),
                _date(context),
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
            },
            child: ContainerWithImage(
                width: 30,
                height: 30,
                image: Global.languageCode == "en" ?
                "assets/icons/back-icon.svg" :
                "assets/icons/back-icon_arabic.svg",
                option: 0
            ),
          ),
          Text(App_Localization.of(context).translate("your_info"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: CommonTextStyle.bigTextStyle
            ),
          ),
          GestureDetector(
            onTap: () {
             bookController.clear();
            },
            child: Container(
              child: Row(
                children: const [
                  Text("Clear",
                    style: TextStyle(
                        color: App.orange,
                        fontSize: CommonTextStyle.mediumTextStyle
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _date(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/year.svg",fit: BoxFit.cover,width: 40,height: 40,color: Colors.white,),
            TextApp(text: App_Localization.of(context).translate("pick_date").toUpperCase(),
                textStyle: CommonTextStyle.textStyleForMediumWhiteNormal
            )
          ],
        ),
        const SizedBox(height: 15),
        perDayHour(context),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            dateDialog(context);
          },
          child: Container(
            width: App.getDeviceWidthPercent(90, context),
            height: 50,
            decoration: BoxDecoration(
              color: App.grey,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Text(
                bookController.saveDate.value ? bookController.range.value :
                App_Localization.of(context).translate("pickup_and_dropOff_date"),
                style: TextStyle(
                  color: App.lightGrey,
                  fontSize: CommonTextStyle.mediumTextStyle
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
  perDayHour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                bookController.selectRentalModel.value = 0;
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
                          color: bookController.selectRentalModel.value == 0 ? Colors.white : Colors.transparent
                      ),
                    ),
                  )
              ),
            ),
            const SizedBox(width: 8),
            Text(App_Localization.of(context).translate("daily"),
              style: CommonTextStyle.textStyleForMediumWhiteNormal,
            ),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                bookController.selectRentalModel.value = 1;
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
                          color: bookController.selectRentalModel.value != 0 ? Colors.white : Colors.transparent
                      ),
                    ),
                  )
              ),
            ),
            const SizedBox(width: 8),
            Text(App_Localization.of(context).translate("hour"),
              style: CommonTextStyle.textStyleForMediumWhiteNormal,
            ),
          ],
        ),
      ],
    );
  }
  dateDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, __, ___){
        return Column(
          children: [
            SizedBox(height: App.getDeviceHeightPercent(100, context)/3.1),
            Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              backgroundColor: App.grey,
              child: Container(
                width: App.getDeviceWidthPercent(90, context),
                // height: App.getDeviceHeightPercent(40, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    SfDateRangePicker(
                      onSelectionChanged: bookController.onSelectionDateChanges,
                      selectionMode: DateRangePickerSelectionMode.range,
                      minDate: DateTime.now(),
                      view: DateRangePickerView.month,
                      monthViewSettings: DateRangePickerMonthViewSettings(
                        viewHeaderStyle: DateRangePickerViewHeaderStyle(
                          textStyle: const TextStyle(
                            color: App.lightGrey
                          ),
                          backgroundColor: App.lightGrey.withOpacity(0.3),
                        ),
                      ),
                      initialSelectedRange: PickerDateRange(
                          DateTime.now().subtract(const Duration()),
                          DateTime.now().add(const Duration())
                      ),
                      selectionTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: CommonTextStyle.mediumTextStyle
                      ),
                      monthCellStyle: const DateRangePickerMonthCellStyle(
                        textStyle: TextStyle(
                         color: Colors.white,
                         fontSize: CommonTextStyle.mediumTextStyle,
                        ),
                        disabledDatesTextStyle: TextStyle(
                            color: App.lightGrey,
                            fontSize: CommonTextStyle.mediumTextStyle,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                      yearCellStyle: const DateRangePickerYearCellStyle(
                        disabledDatesTextStyle: TextStyle(
                            color: App.lightGrey,
                            fontSize: CommonTextStyle.mediumTextStyle,
                            decoration: TextDecoration.lineThrough
                        ),
                        todayTextStyle: TextStyle(
                          fontSize: CommonTextStyle.mediumTextStyle
                        ),
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: CommonTextStyle.mediumTextStyle
                        ),
                      ),
                      rangeSelectionColor: App.lightGrey.withOpacity(0.3),
                      rangeTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: CommonTextStyle.mediumTextStyle
                      ),
                      headerStyle: const DateRangePickerHeaderStyle(
                        textStyle: TextStyle(
                          color: App.orange,
                          fontSize: CommonTextStyle.mediumTextStyle,
                        ),
                      ),
                    ),
                    CustomButton(
                      width: App.getDeviceWidthPercent(40, context),
                      height: 40,
                      text: App_Localization.of(context).translate("confirmation").toUpperCase(),
                      onPressed: () {
                        bookController.saveDate.value = true;
                        print(bookController.range.value);
                        Get.back();
                      },
                      color: App.orange,
                      borderRadius: 15,
                      textStyle: CommonTextStyle.textStyleForBigWhiteNormal,
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            )
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.forward) {
          tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  pickUpDropOffTime(BuildContext context) {
    return Row(
      children: [
        Container(
          width: App.getDeviceWidthPercent(90, context),
          height: 50,
          decoration: BoxDecoration(
              color: App.grey,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(
              bookController.saveDate.value ? bookController.range.value :
              App_Localization.of(context).translate("pickup_and_dropOff_date"),
              style: TextStyle(
                  color: App.lightGrey,
                  fontSize: CommonTextStyle.mediumTextStyle
              ),
            ),
          ),
        ),
      ],
    );
  }

}