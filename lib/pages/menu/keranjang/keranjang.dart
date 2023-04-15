import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          elevation: 4,
          toolbarHeight: 71,
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Image(
                  image: AssetImage("assets/images/keranjang0.png"),
                )),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text("Keranjangmu masih kosong nih",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            )
          ],
        ));
  }
}
