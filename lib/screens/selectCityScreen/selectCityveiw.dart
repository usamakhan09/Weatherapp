import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/base/apikey.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/screens/displayscreen/homeVeiw.dart';
import 'package:weatherapp/screens/landing/homescreenveiw.dart';
import 'package:weatherapp/service/api_service.dart';
import 'package:weatherapp/widgets/buttton.dart';
import 'package:weatherapp/widgets/listfeild.dart';
class SelectCityVeiw extends StatefulWidget {

  const SelectCityVeiw({Key? key}) : super(key: key);

  @override
  State<SelectCityVeiw> createState() => _SelectCityVeiwState();
}

class _SelectCityVeiwState extends State<SelectCityVeiw> {
  var cityname=TextEditingController();
  bool isloading=true;
  ApiResponseService apiresponse1= ApiResponseService();
  var ans1;
  Position? _position;
  callapi()async{
    ans1=  await apiresponse1.getResponseCity(apiKey: ApiKey.key, cityName: "Karachi");

  }
@override
  void initState() {
    super.initState();
  callapi();
}
  void _getCurrentLocation() async {
    Position position1 = await _determinePosition();
    setState(() {
          if(position1!=null)
          {
            _position = position1;
            print(_position.toString());
          }

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
          const SizedBox(height: 30,),
          IconButton(onPressed: (){

            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const LandingScreenVeiw()));
          }, icon: const Icon(Icons.arrow_back_outlined,size:30,)),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Text("Select City",style: TextStyle(fontSize:30 ,fontFamily:'Poppins' ,fontWeight:FontWeight.w600 ),),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
            margin: const EdgeInsets.only(top:20),
            padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
            decoration:  BoxDecoration(
            color:  Colors.white,
            border: Border.all( color: const Color(0x55A8A8A8),width: 1),
            borderRadius: BorderRadius.circular(10),


            ),
            child:TextField(

              controller: cityname,
              // textInputAction: TextInputAction.send,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black,fontSize: 15),
              decoration: const InputDecoration(hintText:'Enter your city name',
              // iconColor: Color(0xff868889),
              hintStyle: TextStyle(color: Color(0xffA8A8A8),fontSize: 15),
              border: InputBorder.none
            ),

              onSubmitted: (cityname)async{

                    setState(()=>Cities.selecteditem=cityname);
                    setState(() {

                      showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
                    });
                    ApiResponseService apiresponse= ApiResponseService();
                    var ans =  await apiresponse.getResponseCity(apiKey: ApiKey.key, cityName: cityname);
                    if((ans?.location?.name)==null) {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context){return  Center(child: AlertDialog(title: Text("Invalid City"),titleTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),content: Text("please Enter a Valid City",),contentTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),buttonPadding: EdgeInsets.all(10),backgroundColor: Colors.grey,actionsOverflowDirection: VerticalDirection.down,));});

                      setState(() {
                        this.cityname.text="";
                      });
                      return ;
                    }
                    Cities.selecteditem=cityname;
                    setState(() {
                      this.cityname.text="";
                      Navigator.pop(context);
                    });
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans)));

              },
            )
            ),
          ),
          const SizedBox(height: 22,),
          Appbutton(label: 'Current Location', onPress: ()async {
            setState(() {

              showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
            });
            _getCurrentLocation();
            ApiResponseService apiresponse= ApiResponseService();
            APIResponse ans =  await apiresponse.getResponse(apiKey: ApiKey.key,latti:_position?.latitude.toString(),longi:_position?.longitude.toString());
            ans =  await apiresponse.getResponse(apiKey: ApiKey.key,latti:_position?.latitude.toString(),longi:_position?.longitude.toString());


            Navigator.pop(context);
            setState((){
            });
            if(ans.location!.name!="Null")
              {

                Cities.selecteditem=ans.location?.name;
                // print(ans.location!.name);
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans)));
              }
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

                    // onTap: (){
                    //   setState(() {
                    //     showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
                    //   });
                    //
                    // },
                  );
                }

            ),
          )
    ],
      ),
    );
  }
}
