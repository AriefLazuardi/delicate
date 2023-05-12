import 'package:delicate/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:delicate/pages/welcome/welcome.dart';
import 'package:delicate/shared/shared.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return WelcomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.cover)),
        ),
        Container(
          alignment: Alignment.center,
          child: Image(image: AssetImage("assets/images/delicate.png")),
        ),
      ]),
    );
  }
}
