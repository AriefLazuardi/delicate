import 'dart:async';
import 'dart:convert';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

   bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final passwordConfirmController = TextEditingController();

  Future _doRegis() async{
    final response = await http.post(Uri.parse("http://localhost:8000/api/register"),body:
    {
      "name" : nameController.text,
      "email" : emailController.text,
      "password" : passwordController.text,
    },
    // headers: {"Accept" : 'application/json'} 
    );
    if (response.statusCode == 200){
      Alert(context: context,
      title: "Pendaftaran Berhasil",
      type: AlertType.success,
      buttons: [
        DialogButton(child: Text("Lanjut Login"),
        onPressed: (){
          Navigator.pop(context,"/login");
        },)
      ]
      );
    }else{
      Alert(context: context, title: "Pendaftaran Gagal", type: AlertType.error).show();
      
    }
  }

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
                                      offset: Offset(0, 4),
                                      blurRadius: 5)
                                ]),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "nama tidak boleh kosong";
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
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Masukkan nama lengkap",
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
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Masukkan password",
                                  hintStyle: TextStyle(
                                      color: blackColor.withOpacity(0.5),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(4),
                          //       boxShadow: [
                          //         BoxShadow(
                          //             color: Colors.black.withOpacity(0.4),
                          //             offset: Offset(0, 4),
                          //             blurRadius: 5)
                          //       ]),
                          //   margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          //   child: TextFormField(
                          //     controller: passwordConfirmController,
                          //     validator: (value) {
                          //       if (value != null) {
                          //         value = value.trim();
                          //         if (value.isEmpty) {
                          //           return "password tidak boleh kosong";
                          //         }
                          //       }
                          //       if(passwordController.text != passwordConfirmController.text){
                          //         return "password tidak sama";
                          //       }
                          //       return null;
                          //     },
                          //     obscureText: _isHidePassword,
                          //     decoration: InputDecoration(
                          //         suffixIcon: GestureDetector(
                          //           onTap: () {
                          //             _togglePasswordVisibility();
                          //           },
                          //           child: Icon(
                          //             _isHidePassword
                          //                 ? Icons.visibility_off
                          //                 : Icons.visibility,
                          //             color: _isHidePassword
                          //                 ? Colors.grey
                          //                 : Colors.blue,
                          //           ),
                          //         ),
                          //         filled: true,
                          //         fillColor: whiteColor,
                          //         enabledBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 width: 0.5,
                          //                 color: Colors.red.shade100)),
                          //         errorBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 width: 0.5,
                          //                 color: Colors.red.shade100)),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Colors.black)),
                          //         hintText: "Konfirmasi password",
                          //         hintStyle: TextStyle(
                          //             color: blackColor.withOpacity(0.5),
                          //             fontWeight: FontWeight.w600)),
                          //   ),
                          // ),
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
                              onPressed: (){
                                _doRegis();
                              },
                              child: Text("DAFTAR",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor))),
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
