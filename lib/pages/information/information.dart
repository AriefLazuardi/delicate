import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              child: Image(image: AssetImage("assets/images/vector.png"))),
        ),
      ),
      backgroundColor: whiteColor,
      body: ListView(
        padding: EdgeInsets.all(0),
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
              Container(
                margin: const EdgeInsets.fromLTRB(40, 80, 40, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apa?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kenapa?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Siapa?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Berapa?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dimana?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bagaimana?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed metus lectus, tincidunt eu pulvinar id",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  // padding: EdgeInsets.only(top: 20),
                  child: Image(image: AssetImage("assets/images/delicate.png")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
