import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/base/baseurl.dart';
import 'package:weatherapp/models/forcastResponse.dart';

class ApiResponseService {

  double? get temparature => _apiResponse?.current?.tempC;

  APIResponse? _apiResponse;
   String? longi;
   String? lattii;

  getResponse({ required String? apiKey,required String? latti,required String? longi }) async {
    var forcastUrl =
    Uri.parse(ApiBaseUrl.baseUrl + '/forecast.json?key=${apiKey}&q=''${lattii}'+',${latti}''&aqi=no');

    try {
      var response = await http.get(forcastUrl,); // get

      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      _apiResponse =
          await APIResponse.fromJson(decodedJson);

      print(temparature);
      return _apiResponse;
    } catch (e) {
      throw e.toString();
    }
  } // getResponse

  Future<APIResponse?> getResponseCity({required String? apiKey, required cityName}) async {
    var forcastUrl =
    Uri.parse(ApiBaseUrl.baseUrl + '/forecast.json?key=${apiKey}&q=${cityName}&days=1&aqi=no&alerts=no');
    // http://api.weatherapi.com/v1/forecast.json?key=4bbcba5c2ab44222be861518222606&q=karachi&days=1&aqi=no&alerts=no
    try {
      var response = await http.get(forcastUrl,); // get

      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;

      _apiResponse =
          APIResponse.fromJson(decodedJson);

      print(temparature);
      return _apiResponse;
    } catch (e) {
      throw e.toString();
    }
  } // getResponse
} // ApiResponseServic