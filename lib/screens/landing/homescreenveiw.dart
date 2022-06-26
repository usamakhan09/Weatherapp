import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screens/selectCityScreen/selectCityveiw.dart';
import 'package:weatherapp/widgets/appButton.dart';
class LandingScreenVeiw extends StatefulWidget {
  const LandingScreenVeiw({Key? key}) : super(key: key);

  @override
  State<LandingScreenVeiw> createState() => _LandingScreenVeiwState();
}

class _LandingScreenVeiwState extends State<LandingScreenVeiw> {
  @override
  Widget build(BuildContext context) {
    List<String> cities=['Select City','karachi','lahore','islamabad'];
    String? selecteditem='Select City';
    return Scaffold(
      body:
      Container(
        margin: EdgeInsets.only(top: 68),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 100,),
            Text("Hello,",style: TextStyle(color: Colors.black,fontSize: 57,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
            Text("let’s set you",style: TextStyle(color: Color(0xffBFBFBF),fontSize: 57,fontWeight: FontWeight.w600,fontFamily: 'Poppins')),
            Text("weather..",style: TextStyle(color: Color(0xff6DC9EF),fontSize: 57,fontWeight: FontWeight.w600,fontFamily: 'Poppins')),
            Image.asset("assets/images/line.png"),
            Spacer(),
            Appbutton(textColor: 0xff000000, buttoncolor: 0xffF1F1F1, label: "Select Current Location", onPress: (){
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (_) => const SelectCityVeiw()));
            }),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff6DC9EF),
              ),
              // color: Color(0xff6DC9EF),
              width: 347,
              child: DropdownButtonFormField<String>(
                dropdownColor: Color(0xff6DC9EF),
                iconEnabledColor: Colors.white,
                decoration: InputDecoration(
                  // fillColor: Color(0xff6DC9EF),
                  enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 3,color:Colors.blue,)

                          ),
                ),
                  // decoration: InputDecoration(
                  //       enabledBorder:OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide: BorderSide(width: 3,color:Colors.blue,)
                  //
                  //       ),
                value: selecteditem,
                items:cities.map((item) => DropdownMenuItem<String>(
                  value: item,
                    child:Text(item,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                )).toList(),
                onChanged: (item)=>setState(()=>selecteditem=item),

              )
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     enabledBorder:OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(width: 3,color:Colors.blue,)
              //
              //     ),
              //   )
              //   items: cities,
              //   value: selecteditem,
              //   onChanged: ,
              // ),
            ),

          ],
        ),
      ),
    );
  }
}

