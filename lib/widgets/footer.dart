import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luxury_version_1/app_localization.dart';
import 'package:luxury_version_1/controller/home_controller.dart';
import 'package:luxury_version_1/controller/introduction_controller.dart';
import 'package:luxury_version_1/controller/product_details_controller.dart';
import 'package:luxury_version_1/helper/app.dart';

class Footer extends StatelessWidget{

  final IntroductionController introductionController;
  final Widget? desc;

  Footer({
    required this.introductionController,
    this.desc
  });

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(100, context),
      color: App.darkGrey,
      child: Column(
          children: [
            SizedBox(height:20),
            homeController.selectNavDrawer.value == 0 ?
                desc != null ? Center() :
            _description(context) : Center(),
            SizedBox(height: homeController.selectNavDrawer.value == 0 ? 50 : 0),
            Container(
              width: App.getDeviceWidthPercent(80, context),
              height: 40,
              child: SvgPicture.asset("assets/icons/logo.svg"),
            ),
            SizedBox(height: 40),
            Container(
              width: App.getDeviceWidthPercent(90, context),
              child: Text(App_Localization.of(context).translate("top_brands").toUpperCase(),
                style: const TextStyle(
                    fontSize: CommonTextStyle.bigTextStyle,
                    color: App.orange,
                    letterSpacing: 0.3,
                    height: 1.3,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              width: App.getDeviceWidthPercent(90, context),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                  ),
                  itemCount: 8,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: () {
                      introductionController.carsByBrand(context,
                          introductionController.homeData!.data!.brands[index].id,index);
                    },
                    child: Text(introductionController.homeData!.data!.brands[index].name,
                        style: TextStyle(
                            fontSize: CommonTextStyle.smallTextStyle,
                            color: Colors.white,
                            letterSpacing: 0.3,
                            height: 1.3,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  );
                  }),
            ),
            SizedBox(height: 40,),
            SizedBox(height: 20,)
          ],
        ),
    );
  }

  _description(BuildContext context) {
    return Container(
      width: App.getDeviceWidthPercent(88, context),
      height: App.getDeviceHeightPercent(35, context),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          controller: introductionController.scrollController,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      width: App.getDeviceWidthPercent(60, context),
                      child: Center(
                        child: Text("Luxury Rent a Car Dubai",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.3,
                            letterSpacing: 1,
                            fontSize: CommonTextStyle.xXlargeTextStyle + 4,
                            color: App.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 15),
                  ///1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Luxury Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: 'If you'"re trying to find the most excellent way to turn your lifestyle into a rich one filled with maximum delight, this is for you! Do you ever think about going on a vacation and getting the chance to try a luxurious ride with your preferred friend? Every person has their own admired car design that they crave to ride. That's why we offer you to enhance every single trip to the fullest, with the most spectacular Luxury ",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: ', and for the most affordable prices. With our agency in Dubai, you won'"t only get the most remarkable memories, but you will also crave more with the most glamorous vehicles.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n"
                                    ),
                                    TextSpan(
                                      text: 'Every beautiful memory includes a unique Lamborghini or Ferrari that looks good and feels even better. Do you still remember the one you cruised in on your wedding day, the one you rented on Christmas, or even the one you hired for a couple of hours when your best friend came to town? See? It'"s always about what brand you drove. Having a vehicle isn't always about more comfortable transportation. It's also about moving our lifestyles to a new level filled with what we crave most. As soon as you get behind the wheel of your dream car, its delight almost feels like everything in the world would stop and watch you as you drive off. Have you ever had that feeling?",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    )
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///2
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sports Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Despite how amazingly great sports models are, each one also comes in an exotic design that can impress your heart and put you at the center of attention. Whether alone or with your friends/family, nothing can help you improve your trip more than a powerful engine that looks great and performs even more fascinating.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n"
                                    ),
                                    TextSpan(
                                      text: "Our extensive collection includes every modern automobile design available in the market, from Lamborghini, Porsche, Audi, Ferrari, and more unusual brands. Cruising in a vehicle you like can instantly turn your adventures into the most extraordinary memories you can ever have. With a Sports ",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: ", nothing can hold you back from enjoying your time to the max.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Nowadays, there are many vehicles that you can enjoy trying for a ride or more. The fascinating thing is that driving a spectacular design you've always liked is something you will never forget. That's why we at Luxury Rent a Car offer you to get your preferred vehicle for a couple of days and enjoy cruising in the UAE. Mixing this city's charm with our unique automobiles and services will make your trip more pleasant.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///3
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SUV Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "There are many beautiful vehicles you can rent and enjoy anytime, anywhere, and for fitting prices, but would it feel more pleasing than cruising in an SUV ",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: "? The fascinating thing about SUV models is how each comes in a magnificent design that looks amazing and feels even more remarkable. The world of vehicles is cruising in a fast Lamborghini towards the future, as it's developing fast, stably, and most notably. Traveling in your dream automobile isn't only more comfortable traveling, but it also feels extra elegant than public transportation.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "We all know how expensive buying an SUV can be, but you don't need to waste your money as we offer several models for unbeatable prices. Usually, SUVs come with a unique body shape, from big wheels to sharp edges and excellent light design. If you're a fun person who has that adventurous spirit, then you need an SUV beauty that can keep up with your mood and let you relish your journeys even more. Get yourself an excellent vacation in the UAE with the charming car brands you desire most from our agency and for the most suitable price.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///4
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Economy Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "If you're having a holiday with your beloved family, then you might like to rent an economy car. It's big enough to keep your precious partner and kids comfortable and still acts remarkably on roads. We at Luxury offer you the most spectacular KIA Sportage and Mazda 6 designs that will provide you with the most exquisite time you can imagine. Each model we offer comes equipped with marvelous features and specifications. These cars run fast, smoothly, and stably and are enjoyable on every road. Going on a holiday with your precious family is about having a good time together.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "You don't need to worry about wasting your money, as these beautiful models don't spend too much gas, and you can always find significant deals and offers on them. These spectacular vehicles work ideally for anyone on vacation with their family who would like to relish a marvelous adventure in the UAE. There are many things you can experience to the fullest in the UAE. For example, you can always go to the mall for some shopping, enjoy indoor skydiving, have a delicious meal with some joy in a 5-star restaurant, or get yourself an Economy ",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: " with any other service you desire.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///5
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Convertible Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "How about a vehicle that can tell everyone about the Luxury of your character? That can also show the adventurer side in your soul? Sounds marvelous, right? Say no more. We got you covered. We offer you a comprehensive collection of the most magnificent designs that can fill your time with richness and turn your style into a notable one that looks on point. Our wide selection includes automobiles from many brands ( Lamborghini, McLaren, Rolls Royce, Audi, Ferrari,  Porsche, and more). Rent your ideal car to pick you up at the hotel when you get to the UAE and begin your vacation uniquely and luxuriously.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "As soon as you get behind the wheel of any glamorous Convertible Rental Dubai model, the UAE will become your dreamland. Don't let anything stop you from appreciating an enhanced trip to the UAE with our Luxury Rent a Car in Dubai. We are always doing our best to combine your elegance with Dubai's charm, the beauty of our models, and the most professional services.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///6
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Exotic Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Have you ever seen someone driving an astonishing automobile model in the street that you couldn't stop looking at and checking every tiny detail of? We've all been through that situation at least once in our lives. That's why we offer you a massive collection of the most remarkable Exotic ",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: " that will add a touch of magic and elegance to your lifestyle at a glance! All you have to do is get behind the wheel, turn the engine on, and let the stunning vehicles throw their spell on everyone around. You'll be called the chic friend who comes in a noble car design.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Now is the right time to step up your game and get a good-looking automobile that can perform astonishingly and perfectly. The unique part about SUV models is how fast and smooth they act on the road and yet look too elegant! One ride in your craved SUV car is all it takes to turn your trip into a fascinating one filled with maximum comfort, satisfaction, delight, and happiness.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Imagine going on a road trip with your group of best friends to the UAE and wanting to cruise in a good-looking vehicle that is fast, smooth, elegant, and can charm anyone who sees it. Well, many places in the UAE can offer you to rent an automobile from their extensive and stunning brands, but do they have our services at the same prices? Luxury Rent a Car offers you the most outstanding Supercar Rental Dubai for unbeatable prices. We care for your pleasure and would like to provide you with nothing less than the most unique and charming adventure.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Dubai, in general, includes hundreds of incredible places where you can appreciate a delight-filled tour. It doesn't matter what kind of experience you're seeking. This place has the perfect nature view to see with your precious person and many 5-star restaurants to try a happy meal. You can also find many beautiful parks where you can try out a wondrous experience in the UAE and the most bizarre museum to learn about the culture of Dubai's people. You can find all you're looking for within a few minutes. As the UAE has many beautiful hidden places, look around, and start exploring its magic.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///7
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chauffeur Service Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Are you on a trip to the UAE for the first time or a resident there? Nothing can flatter your lifestyle more than appearing in a luxurious automobile with a uniformed professional chauffeur. It will feel like you're on the red carpet with your preferred pop artists. How good does that sound? We at Luxury Rent a Car offer you to get the most astonishing models that can steal your heart and fascinate your soul at the same time while lifting your mind too! We also have a group of the most professional drivers who are always ready to provide you with the Luxury you're seeking.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Our expert chauffeurs are uniformed and collected from multi-lingual top drivers, making them perfect for you to enjoy your trip to the fullest every second. We care for your pleasure and would like to offer you nothing but the glamorous trip you desire and more. Call us and enjoy your experience while we handle the hard work while all you do is relish your adventure in the UAE to the fullest with our Chauffeur Service Dubai.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///8
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Car Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "How annoying is it to dream about enjoying a trip in your preferred vehicle but not having enough time to experience renting it? We understand how irritating that feels. That's why we offer you to relish as much time as you have with the most astonishing automobile models from our Luxury Rent a Car in Dubai. We have many options and strategies to help you experience your adventure more enjoyable for as long as you want. With our Monthly/Long-Term ",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Car Rental Dubai',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle + 1,
                                          color: Colors.white.withOpacity(0.6),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: ", you can rent your fancied design for the period you desire and appreciate it to the most comprehensive.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "It only takes a few seconds to rent your favorite one from our agency, but enjoying a trip in any of our models is an adventure you will never forget or regret. Instead, you will love your journey in the UAE more than you can imagine. All you have to do is visit our store, give us a call, or book your craved automobile online; tell us how much time you have, and let us help you make your dreams come true in the most incredible way possible.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///9
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car In Dubai Marina & JLT",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "The UAE is one of the most charming places on earth. It includes many spectacular areas you can enjoy exploring more and more every second. We offer you to rent a car in Dubai Marina & JLT and explore the charming spell of every corner. With our significant automobiles and brands in Dubai, nothing can stop you from appreciating your trip to the most comprehensive without losing a minute.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Whether you're seeking the perfect place to have some alone quality time or relish your trip with your friends/family, this is the ideal place. We offer you to fill your visit with the most exceptional vehicles, beneficial services, and excellent spots in the UAE. With our expert team, you will have the most unforgettable car rental Dubai memories. Dubai Marina & JLT are among the most common places visitors like to see and explore the unique beauty in every tiny corner.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///10
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car In Business Bay",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "If you're a businessman passionate about automobiles, welcome to your dreamland! Every great business person in Dubai Bay has a modern design that looks excellent and performs even better. Rent a Car in Business Bay is a service we offer for the most affordable price. We appreciate how hard you work and how hard it is for you to find some time to enjoy your time in the UAE. That's why we offer you to enhance your trip to the UAE with the most exquisite models from our Luxury agency in Dubai.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "As a business person, you need to have a luxurious style to keep that rich charm attached to your style. That's why you need to check out our chic and classy vehicles that can add a touch of elegance to your style and show others what success feels like! Enhance your time to the finest with the most astonishing automobiles from our agency for the most suitable prices. We care for your pleasure and satisfaction, so give us a call, pick your preferred model, and let us handle the rest to show you what a fancy dream would feel like.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///11
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car In Deira",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "The beautiful Deira is just like any other place in the UAE. It looks marvelous and can make you love it at a glance! It only requires a few seconds to feel curious to explore its hidden beauty in every corner. Our wondrous automobiles at Luxury Rent a Car will make your adventure more enjoyable. Get yourself a fascinating model that can steal your heart and blow your mind with how charming it looks and how powerful it runs on every road. For anyone who doesn't want to waste their money, Deira is the best place for you!",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Deira has many places you can enjoy with your friends/family without wasting your money. All you have to do is get a good-looking and comfortable vehicle that runs as fast and smooth as you desire from our agency and relish it to the fullest. You can also have fun walking nearby Al Hamriya Park or having a good bowling game at Dubai's International Bowling Center. You see, the UAE is a beautiful place filled with many adventures you would appreciate relishing. If you're coming on a vacation, make sure you have enough time to explore the most excellent site you've ever seen.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Deira is a beautiful area in the UAE, perfect for anyone on a budget. It's only 8 km from Dubai Mall and includes everything you need and want. Most people who come to the UAE for work or holidays choose this site to stay in during their visit. It's one of the cheapest places in the UAE and closest to all the public places people like to visit. Generally, you need to try out this remarkable place, especially if you have a beautiful Rent A Car In Deira, to have a joyful cruising experience.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///12
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car In Bur Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "The UAE isn't only a beautiful place to see once in a lifetime and has the most exceptional and beautiful global vibes and colonial and traditional origins. So take a few days to get to know the genuine culture behind UAE's people. You'll be fascinated. You can visit the outstanding Bastakia Quarter, one of the oldest buildings in Dubai. You can also take a walk in Al Fahidi Street and have a fascinating trip filled with maximum satisfaction with our astonishing car models at Luxury Rent a Car in Dubai.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Rent a Car in Bur Dubai and enjoy some cruising fun that's smooth, fast, joyful, and satisfying with our extraordinary automobiles and for the most affordable prices. We care for your satisfaction and would like to provide you with everything you need and want in the most excellent ways possible. We also offer many remarkable car rental Dubai services you would relish and appreciate trying with your rented car. You can always hire a professional chauffeur to drive you to places and add that extra luxury to your lifestyle.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///13
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car In Barsha",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "You can always enhance your trip to the UAE by visiting the beautiful Barsha and cruising around in a unique car model your heart admires most. Barsha is an independent community with a mixture of hotels, restaurants, shopping malls, supermarkets, metro stations, reputed schools, and hospitals. By staying in this place on your visit, you won't need anything outside of it as everything you need is easily accessible inside it. Even if you would like to visit other places while staying here, it's not far from Dubai's mall or any other home in the UAE. As long as you have a car to take you there, you're ready to go!",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Rent A Car In Barsha and let the UAE show you what having a luxurious trip feels like. We at Luxury Rent a Car offer you many outstanding sports, SUVs, economy, family, Luxury, and convertible models that can directly and fastly steal your heart within a few seconds. Our cars are always in perfect condition and have extraordinary shapes for you to enjoy your riding experience more than ever. With our fascinating automobiles, you can now provide your beloved family with all they need while taking care of your business. Let us take good care of your road conditions while all you do is enjoy your journey more.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///14
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rent A Car With a Driver",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Looking elegant, chic, and on point has never been easier now that you can Rent A Car With a Driver from our Luxury Rent a Car in Dubai. Our chauffeurs are experts and knowledgeable about every street and tiny detail in the UAE. With our trained and professional drivers, you can avoid heavy traffic when you're in a hurry, going to work or a friend's gathering, or getting irritated with transactions. Say goodbye to the old days when you spent most of your day stuck between the cars. Instead, say hello to our professional drivers! They will help you get wherever you want within a few minutes by taking the most comfortable roads with no busyness.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Imagine going out to a luxurious party that you've been waiting for, for a few weeks, and you have the chance to impress everyone with a level of elegance they've never known. Wouldn't you take it? By visiting our agency in Dubai, you can boost your grace to a new level of greatness with the most remarkable car models and valuable services. We offer you everything you want and need to relish your trip more than you can imagine! Your luxury lifestyle will always feel outstanding with our expert team in the UAE! You'll eventually be called the elegant best friend who comes elegantly! People might want to get to know you even more.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///15
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lamborghini Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "You don't need to keep seeking a unique driving experience anymore if you have the chance to cruise in a fascinating Lamborghini model. This brand's remarkable thing is how powerful every model they produce is and how extraordinary and bizarre their designs are. As soon as you see a Lambo near, your heart directly skips a beat while you stare at how mind-blowing its appearance is. Despite each model's unique design, Lamborghini also comes with a powerful engine that can fascinate you with every roar. Furthermore, every time you travel in a Lambo can fill your lifestyle with maximum satisfaction.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "In general, this brand is where power meets elegance and delight. We at Luxury Rent a Car appreciate your desires and would love to provide you with the models you seek for the most unbeatable prices. You can also combine your preferred model with any of our services and enjoy your trip even more. If you're in the UAE on a business trip or a vacation, you need a car that can fill your time with what you admire. With Luxury Rent a Car in Dubai, you can enjoy your trip to the fullest with our Lamborghini Rental Dubai.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///16
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ferrari Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Nothing in the world can feel better than getting behind the wheel of a fast car that looks elegant and runs fast and steady on the roads. That's a Ferrari! Here at Luxury Rent a Car, we offer many models from this brand to satisfy your soul and provide you with the most extraordinary time ever. This brand's history is filled with the most outstanding achievements, whether we're talking about racing or the most powerful engines. Every trip in a Ferrari is like lighting the roads with style, energy, and rhythm.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "With our Luxury Rent a Car in Dubai, you will have the chance to cruise in your dream Ferrari model without hesitating about anything. We offer you only maximum pleasure and a trip filled with happiness and delight. Buying a Ferrari might be expensive, but you can always enjoy driving it with our Ferrari Rental Dubai service for the most affordable price. Whether alone or with your friends/family, this is the perfect brand for you to rent from on your holiday. All you have to do is give us a call and let us help you get the pleasure you're seeking.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///17
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rolls Royce Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                text: "Generally, Rolls Royce models and other brands' main difference is quality, power, beauty, and how flawlessly they feel driving. Each model of Rolls Royce is bizarre and comes equipped with the most excellent features and specifications. Here at Luxury Rent a Car in Dubai, we offer you to enhance your lifestyle to the fullest with the most astonishing models that can steal your heart and blow your mind at the same time. Many cars can provide more accessible transportation, but can they fill your driving experience with better feelings? Visit our agency and enjoy enhancing your trip to its most acceptable level with the most astonishing cars.",
                                style: TextStyle(
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: CommonTextStyle.smallTextStyle,
                                    color: App.lightGrey,
                                    fontWeight: FontWeight.normal
                                ),
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///18
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Range Rover Rental Dubai",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                  text: "Generally, Rolls Royce models and other brands' main difference is quality, power, beauty, and how flawlessly they feel driving. Each model of Rolls Royce is bizarre and comes equipped with the most excellent features and specifications. Here at Luxury Rent a Car in Dubai, we offer you to enhance your lifestyle to the fullest with the most astonishing models that can steal your heart and blow your mind at the same time. Many cars can provide more accessible transportation, but can they fill your driving experience with better feelings? Visit our agency and enjoy enhancing your trip to its most acceptable level with the most astonishing cars.",
                                  style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.3,
                                      fontSize: CommonTextStyle.smallTextStyle,
                                      color: App.lightGrey,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "Range Rover is one of the fascinating brands globally due to how remarkable the designs look and how powerful each one acts. Whether you're looking for the perfect model to fill your business trip with elegance, or your vacation with delight, this is the most exquisite brand. The UAE, in general, is one of the most charming places on earth. Can you imagine how fascinating it can be to mix it with a good-looking Range Rover that can provide you with maximum satisfaction? With our car rental Dubai agency, nothing can stop you from enjoying your trip to the max.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n\n"
                                    ),
                                    TextSpan(
                                      text: "We also offer many excellent services you would like to combine with your rented car. You can hire a driver and rent your preferred model for as long as possible. Furthermore, you can always get your dream car to pick you up at the airport and drop you off at the hotel to start your journey in the unique way imaginable. With our remarkable Range Rover Rental Dubai service at Luxury Rent a Car, your trip is one of a kind.",
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          height: 1.3,
                                          fontSize: CommonTextStyle.smallTextStyle,
                                          color: App.lightGrey,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ///19
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Why Luxury Rent a Car Dubai?",
                        style: TextStyle(
                          height: 1.3,
                          letterSpacing: 1,
                          fontSize: CommonTextStyle.xXlargeTextStyle,
                          color: App.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: App.getDeviceWidthPercent(88, context),
                          child: RichText(
                              text: TextSpan(
                                text: "Generally, we care for your satisfaction among all the other car renting agencies in the UAE. Our team seeks every chance to provide you with everything you desire to have the fascinating trip imaginable. With our professional services and great cars, nothing can stop you from enjoying your trips to the fullest within every ride. Get a good-looking car that looks amazing and acts even better with Luxury Rent a Car. If you're wondering:" "Why Luxury Rent a Car in Dubai?" "Simply because no one cares more than we do about what you want, need, or desire with your car rental Dubai experience.",
                                style: TextStyle(
                                    letterSpacing: 0.3,
                                    height: 1.3,
                                    fontSize: CommonTextStyle.smallTextStyle,
                                    color: App.lightGrey,
                                    fontWeight: FontWeight.normal
                                ),
                              )
                          )
                      ),
                    ],
                  ),
                ]
            ),
          ),
        ),
      )
    );
  }

}


