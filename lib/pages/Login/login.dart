import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        padding: EdgeInsets.only(top: 20),
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
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                        Text(
                          "Ketik yang bener ya!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 4),
                                    blurRadius: 5)
                              ]),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return "Harap masukkan password terlebih dahulu";
                              }
                              else if( value.length < 8 && value.length >16 ){
                                return "password terdiri dari 8-16 karakter";
                              }
                              else{
                                return null;
                              };
                              
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: whiteColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Masukkan email/no hp",
                                hintStyle: TextStyle(
                                    color: blackColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 4),
                                    blurRadius: 5)
                              ]),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: TextFormField(
                            obscureText: _isHidePassword,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _togglePasswordVisibility();
                                  },
                                  child: Icon(
                                    _isHidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: _isHidePassword
                                        ? Colors.grey
                                        : Colors.blue,
                                  ),
                                ),
                                filled: true,
                                fillColor: whiteColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Masukkan password",
                                hintStyle: TextStyle(
                                    color: blackColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/login"),
                              child: Text(
                                "Lupa password?",
                                style: TextStyle(color: primaryColor),
                              )),
                        )
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
                                  Navigator.pushNamed(context, "/menu"),
                              child: Text(
                                "MASUK",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
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
                  // kembali ke halaman awal
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: EdgeInsets.all(30),
                        child: Image(
                            image: AssetImage("assets/images/vector.png"))),
                  ),
                  // fitur informasi
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
