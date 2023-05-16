import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/getwidget.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
           title: (Text("Keranjang",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.w600),)),
          backgroundColor: whiteColor,
          elevation: 4,
          leading: GFIconButton(
            icon: const Icon(Icons.arrow_back),
            color: primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, "/homepage");
            },
            type: GFButtonType.transparent,
          ),
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
