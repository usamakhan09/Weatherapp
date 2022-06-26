import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/base/apikey.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/screens/displayscreen/homeVeiw.dart';
import 'package:weatherapp/service/api_service.dart';
import 'package:weatherapp/widgets/buttton.dart';
import 'package:weatherapp/widgets/listfeild.dart';
class SelectCityVeiw extends StatefulWidget {

  const SelectCityVeiw({Key? key}) : super(key: key);

  @override
  State<SelectCityVeiw> createState() => _SelectCityVeiwState();
}

class _SelectCityVeiwState extends State<SelectCityVeiw> {
  final cityname=TextEditingController();

  Position? _position;
  void _getCurrentLocation() async {
    Position position1 = await _determinePosition();
    setState(() {
      _position = position1;
    });
  }
  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_outlined,size:30,)),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("Select City",style: TextStyle(fontSize:30 ,fontFamily:'Poppins' ,fontWeight:FontWeight.w600 ),),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
            margin: const EdgeInsets.only(top:20),
            padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
            decoration:  BoxDecoration(
            color:  Colors.white,
            border: Border.all( color: Color(0x55A8A8A8),width: 1),
            borderRadius: BorderRadius.circular(10),


            ),
            child:TextField(

              controller: cityname,
              style: const TextStyle(color: Colors.black,fontSize: 15),
              decoration: const InputDecoration(hintText:'Enter your city name',
              // iconColor: Color(0xff868889),
              hintStyle: TextStyle(color: Color(0xffA8A8A8),fontSize: 15),
              border: InputBorder.none
            ),
              onSubmitted: (cityname)async{
                setState(()=>Cities.selecteditem=cityname);
                ApiResponseService apiresponse= ApiResponseService();
                var ans =  await apiresponse.getResponseCity(apiKey: ApiKey.key, cityName: cityname);
                Cities.selecteditem=cityname;
                // apiresponse= await apiresponse.getResponse(apiKey: ApiKey.key);
                // getHttp();
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans??APIResponse())));


              },
            )
            ),
          ),
          SizedBox(height: 22,),
          Appbutton(label: 'Current Location', onPress: ()async {
            _getCurrentLocation();
            ApiResponseService apiresponse= ApiResponseService();
            APIResponse ans =  await apiresponse.getResponse(apiKey: ApiKey.key,latti:_position?.latitude.toString(),longi:_position?.longitude.toString());

            Cities.selecteditem=ans.location?.name?.toString();
            // if(_position==null)
            //   {
            //     print("No location");
            //   }else{
            //   print(_position.toString());
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans)));
            // }



            },),

          Expanded(
            child: ListView.builder(
              itemCount: Cities.cities.length,
                itemBuilder: (BuildContext context,int index){

                return
                  ListTile(

                    title:
                    ListFeild(
                    label: Cities.cities[index],
                    ),

                    onTap: ()async{
                      print("hiihi${Cities.cities[index]}");
                      ApiResponseService apiresponse= ApiResponseService();
                      var ans =  await apiresponse.getResponseCity(apiKey: ApiKey.key, cityName:Cities.cities[index]);
                      Cities.selecteditem=Cities.cities[index];
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans??APIResponse())));
                    },
                  );
                }

            ),
          )




    ],
      ),
    );
  }
}
