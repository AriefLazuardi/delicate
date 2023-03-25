import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("DAFTAR",style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800, color: Color(0xffC21010)),),
                Text("isi ini dulu ya!", style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff2D2D2D)),),
              ],
            ),
            Column(
              children: [
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
            Column(
              children: [
                Text("data"),
                Text("data"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}