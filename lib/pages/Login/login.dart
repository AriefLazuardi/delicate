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
      backgroundColor: Color(0xffF4F4F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("LOGIN",style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800, color: Color(0xffC21010)),),
                Text("Ketik yang bener ya!", style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff2D2D2D)),),
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
                        borderSide: BorderSide(color: Colors.black87)
                      ),
                      hintText: "Masukkan email/no hp"
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)
                      ),
                      hintText: "Masukkan password"
                    ),
                  ),
                ),
                Text("Lupa password ?"),
              ],
            ),
            Column(
              children: [
                Container(
                  color: Color(0xffC21010),
                  width: 317,
                  height: 42,
                  child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/login"),
                  child: Text("MASUK",)),
                ),
                Text("Atau masuk menggunakan", style: TextStyle( fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff2D2D2D)),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}