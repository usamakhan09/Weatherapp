import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weatherapp/screens/landing/homescreenveiw.dart';
import 'package:weatherapp/screens/splash/splashScreenVeiw.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LandingScreenVeiw()));
  }

  initScreen(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SplashScreenVeiw(),
      ),
    );

  }
}
