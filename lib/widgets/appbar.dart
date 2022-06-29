import 'package:flutter/material.dart';
import 'package:weatherapp/base/apikey.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/screens/displayscreen/homeVeiw.dart';
import 'package:weatherapp/screens/selectCityScreen/selectCityveiw.dart';
import 'package:weatherapp/service/api_service.dart';

class MyAppBar extends StatefulWidget {
  APIResponse apiresponse;
  MyAppBar({Key? key,required this.apiresponse}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(onPressed:() async {
              setState(() {
                showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
              });
              Cities.selecteditem=widget.apiresponse.location?.name;
              ApiResponseService apiresponse= ApiResponseService();
              var ans =  await apiresponse.getResponseCity(apiKey: ApiKey.key, cityName: widget.apiresponse.location?.name);
              Navigator.of(context);
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans??APIResponse())));
            }, icon: Icon(Icons.refresh,color: Colors.white,size: 22,)),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${((Cities.selecteditem?.split(" "))![0])}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
              IconButton(onPressed: (){
                setState(() {
                  showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
                });

                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) =>  SelectCityVeiw()));

              }, icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 22,))
            ],
          ),
        ),

        // Expanded(flex:1,child: Row(), )
      ],
    );
  }
}
