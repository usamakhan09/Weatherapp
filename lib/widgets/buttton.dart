import 'package:flutter/material.dart';

class  Appbutton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPress;
  const Appbutton({required this.label,required this.onPress});

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
        onTap: onPress,
        child: Row(
          children: [
            SizedBox(width:20,height:20,child: Image.asset("assets/images/map.png")),
            SizedBox(width: 5,),
            Text(label,style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
