import 'package:flutter/material.dart';

class Forcast_card extends StatelessWidget {
  final String time;
  var icon;
  String  temC;
  Forcast_card({Key? key,required this.time,required this.icon,required this.temC}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // SizedBox(width: 34,),
        Text(time),
        SizedBox(height: 5,),
        SizedBox(height:42,width: 42,child: Image.network('https:${(icon)??""}')),
        SizedBox(height: 5,),
        Text('${temC}\u00b0',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),

      ],
    );
  }
}

