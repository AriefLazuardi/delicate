import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final kodeController = TextEditingController();

  

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
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: TextFormField(
                              controller: kodeController,
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
                            ),
                          ),
                      )],
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
                                // _doForgot();
                              },
                              child: Text(
                                "Kirim Kode",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Belum memiliki akun? silahkan",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/register"),
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ],
                    )
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
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}