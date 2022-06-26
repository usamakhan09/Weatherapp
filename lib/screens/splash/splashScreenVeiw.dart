import 'package:flutter/material.dart';

class SplashScreenVeiw extends StatelessWidget {
  const SplashScreenVeiw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(

            children: [
              Spacer(),
              Center(child: Image.asset("assets/images/frame.png",width: 129,height:134 ,)),
              Spacer(),
              Text("Powered By Tech Idara",style:TextStyle(fontWeight: FontWeight.bold,fontFamily: "popins",fontSize: 17)),
              SizedBox(height: 10)

            ],
          ),
        ),
      ),
    );
  }
}
