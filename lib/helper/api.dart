import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:luxury_version_1/model/about.dart';
import 'package:luxury_version_1/model/all-cars.dart';
import 'package:luxury_version_1/model/blog-info.dart';
import 'package:luxury_version_1/model/blog.dart';
import 'package:luxury_version_1/model/brands.dart';
import 'package:luxury_version_1/model/car-info.dart';
import 'package:luxury_version_1/model/faq.dart';
import 'package:luxury_version_1/model/home-data.dart';
import 'package:luxury_version_1/model/terms.dart';

class API {

  static String url = "https://new.luxurycarrental.ae";

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static Future<HomeData?> getHome() async {
    var headers = {
      'accept-language': 'ar'
    };
    var request = http.Request('GET', Uri.parse( url +'/api/home'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print('!!!!!!!!!!!!!!!!!!!!!!!1');
      // print(data.length);
      return HomeData.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
    return null;
    }
  }

  static Future<AllCars?> getAllCars() async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse( url + '/api/getAllCars'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print(data);
      return AllCars.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<CarInfo?> getCarsById(String id) async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse( url +'/api/carDetails?id=$id'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      CarInfo carInfo = CarInfo.fromMap(jsonData);
      // print(carInfo.message);
      // print(carInfo.data!.car!.id);
      return carInfo;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<AllCars?> filter(String vehicleType,String rentType,String minPrice,String maxPrice,List<BrandInfo> brand,String carBody)async{
    var headers = {
      'accept-language': 'en'
    };
    var request = http.MultipartRequest('POST', Uri.parse(url + '/api/filter'));
    request.fields.addAll({
      'vehicle_type': vehicleType,
      'rent_type': rentType,
      'min_price': minPrice,
      'max_price': maxPrice,
      'brands': List<dynamic>.from(brand.map((x) => x.toMap())).toString(),
      'car_body': carBody,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      return AllCars.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<AllCars?> search(String query)async{
    var headers = {
      'accept-language': 'en'
    };
    var request = http.MultipartRequest('POST', Uri.parse(url + '/api/search'));
    request.fields.addAll({
      'key': query
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      return AllCars.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<AllBrands?> getCarsByBrand(int carId) async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse(url + '/api/carsBrand?id=$carId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      AllBrands allBrands = AllBrands.fromMap(jsonData);
      // print(allBrands.message);
      // print(allBrands.brand.brands!.length);
      return allBrands;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<AboutUs?> getAboutUs() async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse(url + '/api/about'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print(data);
      return AboutUs.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<RentTerms?> getTerms() async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse(url + '/api/terms'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print(data);
      return RentTerms.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<Faq?> getFAQ() async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse(url + '/api/faq'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print(data);
      return Faq.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<BLOG?> getBlogs() async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse(url + '/api/blog'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      // print(data);
      return BLOG.fromMap(jsonData);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<BlogsInfo?> getBlogById(String id) async {
    var headers = {
      'accept-language': 'en'
    };
    var request = http.Request('GET', Uri.parse( url +'/api/blogDetails?id=$id'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var jsonData = json.decode(data);
      BlogsInfo blogsInfo = BlogsInfo.fromMap(jsonData);
      // print(blogsInfo.message);
      // print(blogsInfo.blogData!.blogInfo!.id);
      return blogsInfo;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

}