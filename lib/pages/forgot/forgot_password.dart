import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // controller untuk form email/no hp
  final _formState = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: const Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
      ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Form(
                        key: _formState,
                        child: Column(
                          children: [
                            Container(
                              height: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        offset: const Offset(0, 4),
                                        blurRadius: 5)
                                  ]),
                              margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
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
                                    contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10),
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
                              color: primaryColor,
                              width: 318,
                              height: 42,
                              child: TextButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
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
                                    "KONFIRMASI",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ],
                        )),
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
