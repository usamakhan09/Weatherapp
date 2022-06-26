import 'package:flutter/material.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/screens/selectCityScreen/selectCityveiw.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Padding(
          padding: EdgeInsets.only(left:17),
          child:IconButton(onPressed: (){



          }, icon: Icon(Icons.refresh,color: Colors.white,size: 22,))
        ),
        Padding(
          padding: EdgeInsets.only(left:100),
          child: Row(
            children: [
              Text("${Cities.selecteditem}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
              IconButton(onPressed: (){

                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) => const SelectCityVeiw()));

              }, icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 22,))
            ],
          ),
        )
      ],
    );
  }
}
