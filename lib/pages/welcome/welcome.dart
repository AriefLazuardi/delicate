import 'package:flutter/material.dart';
import 'package:delicate/shared/shared.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delicate"),
      ),
      body: Column(
        children: [
          Container(
            width: 314,
            height: 42,
            color: Color(0xffC21010),
            child: Text("Mulai"),
          )
        ],
      ),
    );
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 120, 353, 0),
                  ),
                  Icon(
                    Icons.info_outlined,
                    color: primaryColor,
                    size: 25.0,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/register"),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () => Navigator.pushNamed(context, "/login"),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
