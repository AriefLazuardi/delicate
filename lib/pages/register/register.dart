import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/pages/information/information.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
// import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isHidePassword = true;
  bool _isHidePasswordConfirm = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void _togglePasswordConfirmVisibility() {
    setState(() {
      _isHidePasswordConfirm = !_isHidePasswordConfirm;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future _doRegis() async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/register"),
      body: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      },
      // headers: {"Accept" : 'application/json'}
    );
    if (response.statusCode == 200) {
      Alert(
          context: context,
          title: "Pendaftaran Sukses",
          type: AlertType.success,
          buttons: [
            DialogButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/login");
                })
          ]).show();
      nameController.text = "";
      emailController.text = "";
      passwordController.text = "";
      passwordConfirmController.text = "";
    } else {
      Alert(
              context: context,
              title: "Pendaftaran Gagal",
              buttons: [
                DialogButton(
                  child: Text(
                    "Kembali",
                    style: TextStyle(color: whiteColor, fontSize: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ],
              type: AlertType.error)
          .show();
      emailController.text = "";
      passwordController.text = "";
      passwordConfirmController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              child: Image(image: AssetImage("assets/images/vector.png"))),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Information())),
            child: Container(
                child: const Image(
                    image: AssetImage("assets/images/infocircle.png"))),
          ),
        ],
      ),
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
                margin: EdgeInsets.only(top: 30),
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
                      key: _formKey,
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
                                    return "kata sandi tidak boleh kosong";
                                  }
                                }
                                if (value!.trim().length < 8) {
                                  return 'kata sandi minimal 8 karakter';
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
                                  hintText: "Masukkan kata sandi",
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
                              controller: passwordConfirmController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "kata sandi tidak boleh kosong";
                                  }
                                }
                                // if (value!.trim().length < 8) {
                                //   return 'kata sandi minimal 8 karakter';
                                // }
                                // Return null if the entered password is valid
                                if (passwordController.text !=
                                    passwordConfirmController.text) {
                                  return "kata sandi tidak sama";
                                }
                                return null;
                              },
                              obscureText: _isHidePasswordConfirm,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _togglePasswordConfirmVisibility();
                                    },
                                    child: Icon(
                                      _isHidePasswordConfirm
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _isHidePasswordConfirm
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
                                  hintText: "Konfirmasi kata sandi",
                                  hintStyle: TextStyle(
                                      color: blackColor.withOpacity(0.5),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
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
                                if (_formKey.currentState!.validate()) {
                                  _doRegis();
                                }
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
            ],
          ),
        ],
      ),
    );
  }
}
