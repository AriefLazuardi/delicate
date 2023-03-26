import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delicate"),
      ),
      body: Column(
        children: [
          Container(
            width: 314,
            height: 42,
            color: Color(0xffC21010),
            child: Text("Mulai"),
          )
        ],
      ),
    );
  }
}
