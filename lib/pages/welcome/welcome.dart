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
            color: primaryColor,
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
        backgroundColor: whiteColor,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/pattern.png"),
                          fit: BoxFit.cover)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 120, 353, 0),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Image(
                          image: AssetImage("assets/images/delicate.png")),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 75),
                        child: Image(
                          image: AssetImage("assets/images/celebration.png"),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Temukan masakan tepat untuk",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        "momen acaramu di Delicate",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      color: primaryColor,
                      width: 317,
                      height: 42,
                      child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/bottomnavbar"),
                          child: Text(
                            "MULAI",
                            style: TextStyle(color: whiteColor),
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
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/login"),
                              child: Text(
                                "Masuk",
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
              ],
            )
          ],
        ));
  }
}
