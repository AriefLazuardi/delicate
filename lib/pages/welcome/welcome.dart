import 'package:flutter/material.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/services.dart';

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
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('Ingin keluar dari App?'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Tidak'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Ya'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
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
          )),
    );
  }
}
