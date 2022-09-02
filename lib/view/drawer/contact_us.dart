import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:luxury_version_1/controller/contact_us_controller.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/helper/app.dart';
import 'package:luxury_version_1/widgets/custom_button.dart';
import 'package:luxury_version_1/widgets/drawer.dart';
import 'package:luxury_version_1/widgets/footer.dart';
import 'package:luxury_version_1/widgets/text_app.dart';
import 'package:luxury_version_1/widgets/title_and_description.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key) {
    contactUsController.clearTextField();
  }

  ContactUsController contactUsController = Get.put(ContactUsController());
  HomeController homeController = Get.find();
  IntroductionController introductionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: contactUsController.key,
        drawer: CustomDrawer(homeController: homeController),
        body: Obx(() => Stack(
          children: [
            Container(
              width: App.getDeviceWidthPercent(100, context),
              height: App.getDeviceHeightPercent(100, context),
              color: App.darkGrey,
            ),
            contactUs(context),
          ],
        ))
    );
  }

  contactUs(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top,),
          header(context),
          SizedBox(height: 15),
          body(context),
          SizedBox(height: 20),
          Footer(introductionController: introductionController)
        ],
      ),
    );
  }
  header(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(100, context),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/top-nav.png"),
              fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                contactUsController.key.currentState!.openDrawer();
              },
              child: Icon(Icons.menu,size: CommonTextStyle.headerIcons,color: App.orange),
            ),
            GestureDetector(
              onTap: () {
                homeController.selectNavDrawer.value = 0;
                homeController.key.currentState!.openEndDrawer();
              },
              child: Container(
                child: SvgPicture.asset("assets/icons/logo.svg",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
  body(BuildContext context) {
    return Column(
      children: [
        title(context),
        textFields(context),
        SizedBox(height: 30,),
        locationCallWhatsapp(context),
        SizedBox(height: 30,),
        Center(
          child: TextApp(
              text: "WE ARE ON SOCIAL NETWORKS",
              textStyle: TextStyle(
                fontSize: CommonTextStyle.mediumTextStyle,
                color: Colors.white.withOpacity(0.5)
              )
          ),
        ),
        SizedBox(height: 20),
        socialMedia(context),
        SizedBox(height: 20),
      ],
    );
  }
  title(BuildContext context) {
    return TitleAndDescription(
      text1: "CONTACT US",
      text2: "",
      textAlign: TextAlign.center,
      textStyle1: const TextStyle(
        letterSpacing: 1,
        height: 1.3,
        fontSize: CommonTextStyle.xXlargeTextStyle,
        color: App.orange,
        fontWeight: FontWeight.bold,
      ),
      textStyle2: const TextStyle(
          letterSpacing: 0.3,
          height: 1.3,
          fontSize: CommonTextStyle.smallTextStyle,
          color: App.field,
          fontWeight: FontWeight.normal
      ),
      width1: 90,
      width2: 85,
    );
  }
  textFields(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(90, context),
      decoration: BoxDecoration(
          color: App.grey,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          SizedBox(height: App.getDeviceHeightPercent(3, context)),
          Center(
            child: Text("Do You Need Help With Choosing A Car?",
              style: TextStyle(
                  fontSize: CommonTextStyle.tinyTextStyle,
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 15),
          App.normalTextField(
            context: context,
            text: "NAME",
            textStyle: CommonTextStyle.textStyleForMediumWhiteNormal,
            width: App.getDeviceWidthPercent(80, context),
            height: App.getDeviceHeightPercent(8.5, context),
            controller: contactUsController.name,
            validate: contactUsController.nameValidate.value,
            textAlignVertical: contactUsController.nameValidate.value ? TextAlignVertical.bottom : TextAlignVertical.center,
            hintText: "Enter Name",
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: CommonTextStyle.mediumTextStyle
            ),
            errorText: "This value is required",
          ),
          SizedBox(height: 5),
          App.normalTextField(
            context: context,
            text: "EMAIL",
            textStyle: CommonTextStyle.textStyleForMediumWhiteNormal,
            width: App.getDeviceWidthPercent(80, context),
            height: App.getDeviceHeightPercent(8.5, context),
            controller: contactUsController.email,
            validate: contactUsController.emailValidate.value,
            textAlignVertical: contactUsController.emailValidate.value ? TextAlignVertical.bottom : TextAlignVertical.center,
            hintText: "Enter Email",
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: CommonTextStyle.mediumTextStyle
            ),
            errorText: "This value is required",
          ),
          SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PHONE",style: CommonTextStyle.textStyleForMediumWhiteNormal,),
              SizedBox(height: 10),
              Container(
                  width: App.getDeviceWidthPercent(80, context),
                  height: App.getDeviceHeightPercent(contactUsController.phoneValidate.value ? 8.5 : 9, context),
                  child: IntlPhoneField(
                    style: CommonTextStyle.textStyleForMediumWhiteNormal,
                    controller: contactUsController.phone,
                    cursorColor: Colors.white,
                    textAlignVertical: contactUsController.phoneValidate.value ? TextAlignVertical.bottom : TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: App.textField,
                      hintText: "Enter Phone",
                      hintStyle:  TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: CommonTextStyle.mediumTextStyle
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:  BorderSide(color: App.orange)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: App.textField)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: App.textField)
                      ),
                      errorText: contactUsController.phoneValidate.value ? "This value is required" : null,
                    ),
                    initialCountryCode: 'AE',
                    disableLengthCheck: true,
                    dropdownIcon: Icon(Icons.arrow_drop_down_outlined,color: Colors.white.withOpacity(0.3),),
                    dropdownTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: CommonTextStyle.mediumTextStyle
                    ),
                    flagsButtonMargin: const EdgeInsets.only(left: 15),
                    showDropdownIcon: true,
                    dropdownIconPosition: IconPosition.trailing,
                    onChanged: (phone) {
                      print(phone.countryCode);
                    },
                  )
              ),
            ],
          ),
          SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MESSAGE",style: CommonTextStyle.textStyleForMediumWhiteNormal,),
              SizedBox(height: 10),
              Container(
                width: App.getDeviceWidthPercent(80, context),
                height: App.getDeviceHeightPercent(13, context),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  style: CommonTextStyle.textStyleForMediumWhiteNormal,
                  cursorColor: Colors.white,
                  controller: contactUsController.message,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: App.textField,
                      hintText: "Enter Message",
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: CommonTextStyle.mediumTextStyle
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:  BorderSide(color: App.orange)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: App.textField)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: App.textField)
                      ),
                      contentPadding: EdgeInsets.only(top: 15,bottom: 70,left: 15)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: App.getDeviceHeightPercent(3, context)),
          CustomButton(
            width: App.getDeviceWidthPercent(80, context),
            height: App.getDeviceHeightPercent(7, context),
            text: "SEND",
            onPressed: () {
              contactUsController.send(context, contactUsController.name.text,contactUsController.email.text,
                  contactUsController.phone.text);
            },
            color: App.orange,
            borderRadius: 20,
            textStyle: CommonTextStyle.textStyleForBigWhiteNormal,
          ),
          SizedBox(height: App.getDeviceHeightPercent(3, context)),
        ],
      ),
    );
  }
  locationCallWhatsapp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            homeController.openMap();
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: App.grey,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.location_pin,color: App.orange,size: 30,),
          ),
        ),
        SizedBox(width: 25,),
        GestureDetector(
          onTap: () async {
              if(await canLaunchUrl(Uri.parse('tel: +971 4 392 7704'))){
                await launchUrl (Uri.parse('tel: +971 4 392 7704'));
              }
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: App.grey,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.call,color: App.orange,size: 28,),
          ),
        ),
        SizedBox(width: 25,),
        GestureDetector(
          onTap: () {
            App.lunchURL(context,"https://api.whatsapp.com/send?phone=+971553451555&text=");
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: App.grey,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.whatsapp,color: App.orange,size: 30,),
          ),
        ),
      ],
    );
  }
  socialMedia(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            App.lunchURL(context,"https://www.instagram.com/accounts/login/?next=/luxurycarrental_ae/");
          },
          child: SvgPicture.asset("assets/icons/instagram.svg",width: 18,height: 18,color: App.orange,),
        ),
        SizedBox(width: 20,),
        GestureDetector(
          onTap: () {
            App.lunchURL(context, "https://www.facebook.com/luxurycarrental.ae/");
          },
          child: SvgPicture.asset("assets/icons/facebook.svg",width: 18,height: 18,color: App.orange,),
        ),
        SizedBox(width: 20,),
        GestureDetector(
          onTap: () {
            App.lunchURL(context, "https://twitter.com/luxurycarsdxb");
          },
          child: SvgPicture.asset("assets/icons/twitter.svg",width: 16,height: 16,color: App.orange,),
        ),
        SizedBox(width: 20,),
        GestureDetector(
          onTap: () {
            App.lunchURL(context, "https://www.youtube.com/channel/UCg8q_8DqhHBeqnkOSscbdUw");
          },
          child: SvgPicture.asset("assets/icons/youtube.svg",width: 16,height: 16,color: App.orange,),
        ),
      ],
    );
  }
}
