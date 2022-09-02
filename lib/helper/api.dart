import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:luxury_version_1/model/all-cars.dart';
import 'package:luxury_version_1/model/brands.dart';
import 'package:luxury_version_1/model/car-info.dart';
import 'package:luxury_version_1/model/home-data.dart';

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
    var request = http.MultipartRequest('GET', Uri.parse( url +'/api/carDetails?id=$id'));
    request.fields.addAll({
      'id': id
    });
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

}