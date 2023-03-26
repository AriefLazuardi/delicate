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
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "DAFTAR",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w800,
                        color: primaryColor),
                  ),
                ),
                Container(
                  child: Text(
                    "isi ini dulu ya!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: blackColor),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor)),
                        hintText: "Masukkan email/no hp"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor)),
                        hintText: "Masukkan password"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor)),
                        hintText: "Konfirmasi password"),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  color: (primaryColor),
                  width: 320,
                  height: 45,
                  child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/register"),
                      child: Text(
                        "DAFTAR",
                      )),
                ),
                Text(
                  "Atau masuk menggunakan",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
