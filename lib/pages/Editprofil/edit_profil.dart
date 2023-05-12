import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:getwidget/getwidget.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _formState = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final nohpController = TextEditingController();
  final emailController = TextEditingController();
  final alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        titleSpacing: 0,        
        title: (Text("Edit Profil",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.w600),)),
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: const CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(""), //NetworkImage
                                      radius: 100,
                                    ),
                                  ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey.shade400)),
                                  ),
                                  margin: EdgeInsets.fromLTRB(20,0 ,20, 10),
                                  child: TextFormField(
                                    controller: namaController,
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
                                        border: InputBorder.none,
                                        labelText: "Nama",
                                        labelStyle: TextStyle(
                                            fontSize: 14, color: blackColor)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: TextFormField(
                              controller: nohpController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "no hp tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "No hp",
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
                                  border: InputBorder.none,
                                  labelText: "Email",
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
                              controller: alamatController,
                              validator: (value) {
                                if (value != null) {
                                  value = value.trim();
                                  if (value.isEmpty) {
                                    return "alamat tidak boleh kosong";
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Alamat",
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
