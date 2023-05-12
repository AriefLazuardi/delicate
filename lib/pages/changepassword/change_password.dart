import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:getwidget/getwidget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formState = GlobalKey<FormState>();
  final currentpwController = TextEditingController();
  final newpwController = TextEditingController();
  final confirmpwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
         titleSpacing: 0,        
        title: (Text("Ganti Kata Sandi",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.w600),)),
        backgroundColor: whiteColor,
        elevation: 0,
        leading: GFIconButton(
          icon: const Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Form(
                      key: _formState,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: TextFormField(
                              controller: currentpwController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "password tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Kata sandi saat ini",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: blackColor)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: TextFormField(
                              controller: newpwController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "password tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Kata sandi baru",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: blackColor)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: TextFormField(
                              controller: confirmpwController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "password tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Konfirmasi kata sandi",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: blackColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Column(
                      children: [
                        Container(
                          color: primaryColor,
                          width: 317,
                          height: 42,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  // do something
                                  print("validation success");
                                } else {
                                  print("validation failed");
                                }
                              },
                              child: Text(
                                "Simpan",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/forgot"),
                              child: Text(
                                "Lupa kata sandi?",
                                style: TextStyle(color: primaryColor),
                              )),
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
