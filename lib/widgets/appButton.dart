import 'package:flutter/material.dart';

class  Appbutton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPress;
  final int buttoncolor;
  final int textColor;
  const Appbutton({required this.textColor,required this.buttoncolor,required this.label,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top :10),
            padding: const EdgeInsets.all(20),
            decoration:  BoxDecoration(
                color:  Color(buttoncolor),
                border: Border.all( color:  Color(buttoncolor),width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: onPress,
              child: Row(
                children: [
                  Text(label,style:  TextStyle(color: Color(textColor),fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Poppins')),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
