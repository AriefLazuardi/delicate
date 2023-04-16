import 'dart:async';
import 'dart:convert';

// import 'package:delicate/pages/menu/menu.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
// import 'package:form_field_validator/form_field_validator.dart';

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


  final _formState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future _doLogin() async{
    final response = await http.post(Uri.parse("http://localhost:8000/api/login"),body:
    {
      "email" : emailController.text,
      "password" : passwordController.text
    },
    // headers: {"Accept" : 'application/json'} 
    );
    if (response.statusCode == 200){
      Alert(context: context, title: "Login Berhasil", type: AlertType.success);
      Navigator.pushNamed(context, "/bottomnavbar");
    }else{
      Alert(context: context, title: "Login Gagal", type: AlertType.error).show();
      passwordController.text="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
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
                margin: const EdgeInsets.only(top: 60),
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
                    Form(
                      key: _formState,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      offset: const Offset(0, 4),
                                      blurRadius: 5)
                                ]),
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "email tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: whiteColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Colors.red.shade100)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Colors.grey.shade100)),
                                  focusedBorder: const OutlineInputBorder(
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
                                      offset: const Offset(0, 4),
                                      blurRadius: 5)
                                ]),
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "password tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
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
                                          color: Colors.red.shade100)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Colors.red.shade100)),
                                  focusedBorder: const OutlineInputBorder(
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
                              onPressed: () {
                                _doLogin();
                                if (_formState.currentState!.validate()) {
                                  // do something
                                  print("validation success");
                                  
                                } else {
                                  print("validation failed");
                                }
                              },
                              child: Text(
                                "MASUK",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
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
                        padding: const EdgeInsets.all(30),
                        child: const Image(
                            image: AssetImage("assets/images/vector.png"))),
                  ),
                  // fitur informasi
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: const EdgeInsets.all(30),
                        child: const Image(
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
