import 'package:flutter/material.dart';
import 'package:weatherapp/screens/splash/splashScreenVeiwmodel.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SplashScreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}