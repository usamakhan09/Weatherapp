import 'package:flutter/material.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/screens/displayscreen/homeVeiw.dart';

class ListFeild extends StatelessWidget {
  final String label;
  const ListFeild({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top :10),
      padding: const EdgeInsets.all(25),
      decoration:  BoxDecoration(
          color: const Color(0xffF6F6F6),
          border: Border.all( color: const Color(0xffF6F6F6),width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: (){

          if(Cities.cities.contains(label))
            {
              Cities.selecteditem=label;
            }
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse: APIResponse(),)));
        },
        child: Row(
          children: [
            SizedBox(width: 5,),
            Text(label,style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
