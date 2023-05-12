import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class NotLogin extends StatefulWidget {
  const NotLogin({super.key});

  @override
  State<NotLogin> createState() => _NotLoginState();
}

class _NotLoginState extends State<NotLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Image(image: AssetImage("assets/images/delicate.png")),
        elevation: 0,
      ),
    );
  }
}