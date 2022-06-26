// import 'package:dio/dio.dart';
// import 'package:weatherapp/models/cities.dart';
// import 'package:weatherapp/models/forcastResponse.dart';
// Future<ForcastResponse> getHttp()  async{
//
//
//     Future<ForcastResponse> forcast=ForcastResponse.fromJson(response.data) as Future<ForcastResponse>;
//     print(Location.fromJson(response.data));
//
//
//     try {
//       var response = await Dio().get('http://api.weatherapi.com/v1/forecast.json?key=4bbcba5c2ab44222be861518222606&q=${Cities.selecteditem}&days=7&aqi=no&alerts=no');
//       print('User Info: ${userData.data}');
//       user = User.fromJson(userData.data);
//     } on DioError catch (e) {
//       // The request was made and the server responded with a status code
//       // that falls out of the range of 2xx and is also not 304.
//       if (e.response != null) {
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         // Error due to setting up or sending the request
//         print('Error sending request!');
//         print(e.message);
//       }
//     }
//
//
//     return forcast;
// }