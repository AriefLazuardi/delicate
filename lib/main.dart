import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/welcome/welcome.dart';
import 'package:delicate/pages/register/register.dart';
import 'package:delicate/pages/kelolaakun/profil.dart';
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
          "/register": (context) => Register(),
        });
  }
}
