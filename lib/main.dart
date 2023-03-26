import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/welcome/welcome.dart';
import 'package:delicate/pages/register/register.dart';
import 'package:delicate/shared/shared.dart';
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

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 150),
                child: Image(image: AssetImage("assets/images/delicate.png")),
              ),
              Container(
                  padding: EdgeInsets.only(top: 75),
                  child: Image(
                    image: AssetImage("assets/images/celebration.png"),
                  )),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Temukan masakan tepat untuk momen acaramu di Delicate",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                color: Color(0xffC21010),
                width: 317,
                height: 42,
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/login"),
                    child: const Text(
                      "MULAI",
                      style: TextStyle(color: Color(0xffF4f4f4)),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/register"),
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: primaryColor),
                    )),
              ),
            ],
          ),
        ));
  }
}
