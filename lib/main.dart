import 'package:delicate/pages/forgot/forgot_password.dart';
import 'package:delicate/pages/information/information.dart';
import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/menu/HomePage.dart';
import 'package:delicate/pages/menu/pencarian/pencarian.dart';
import 'package:delicate/pages/toko/toko.dart';
import 'package:delicate/pages/welcome/welcome.dart';
import 'package:delicate/pages/register/register.dart';
import 'package:delicate/pages/menu/HomePage.dart';
import 'package:delicate/splashscreen_view.dart';
import 'package:delicate/pages/bottomnavbar/bottomnavbar.dart';
import 'package:delicate/pages/menu/category/healthy.dart';
import 'package:delicate/pages/menu/category/reguler.dart';
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
            textTheme:
                const TextTheme(bodyMedium: TextStyle(fontFamily: "Poppins"))),
        home: SplashScreenPage(),
        initialRoute: "/SpalashScreenPage",
        routes: {
          "/SpalashScreenPage": (context) => SplashScreenPage(),
          "/login": (context) => const Login(),
          "/welcome": (context) => Welcome(),
          "/register": (context) => const Register(),
          "/homepage": (context) => HomePage(),
          "/forgot": (context) => ForgotPassword(),
          "/information": (context) => Information(),
          "/bottomnavbar": (context) => BottomNavbar(),
          "/regulermenu": (context) => RegulerMenu(),
          "/healthymenu": (context) => HealthyMenu(),
          "/lihat": (context) => TokoPage(),
          "/pencarian": (context) => Pencarian(),
        });
  }
}
