import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "DAFTAR",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: primaryColor),
                        ),
                        Text(
                          "Isi ini dulu ya!",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                    blurRadius: 5)
                              ]),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: whiteColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.grey.shade100)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: "Masukkan email/no hp",
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                    blurRadius: 5)
                              ]),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: whiteColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: "Masukkan password"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                    blurRadius: 5)
                              ]),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 35),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: whiteColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: "Konfirmasi password"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Column(
                      children: [
                        Container(
                          color: primaryColor,
                          width: 317,
                          height: 42,
                          child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/login"),
                              child: Text("DAFTAR",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor))),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Atau masuk menggunakan",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2D2D2D)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: EdgeInsets.all(30),
                        child: Image(
                            image: AssetImage("assets/images/vector.png"))),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: EdgeInsets.all(30),
                        child: Image(
                            image: AssetImage("assets/images/infocircle.png"))),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
