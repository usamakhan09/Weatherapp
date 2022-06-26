import 'package:weatherapp/service/api_service.dart';

class HomeModelVeiw{
   static String? temp;

  static gettemp(ApiResponseService apiresponse)async{
    temp= await apiresponse.temparature.toString();
  }
}