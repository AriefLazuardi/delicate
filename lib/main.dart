import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Poppins",
            textTheme: TextTheme(bodyMedium: TextStyle(fontFamily: "Poppins"))),
        home: WelcomePage(),
        routes: {
          "/login": (context) => Login(),
          "/welcome": (context) => Welcome(),
        });
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        body: Center(
          child: Container(
            width: 150,
            height: 52,
            child: Image(image: AssetImage("assets/images/logo_delicate.png")),
          ),
        ));
  }
}
