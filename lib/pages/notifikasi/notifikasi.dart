import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        // leading: GFIconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   color: Colors.grey.shade600,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   type: GFButtonType.transparent,
        // ),

        elevation: 4,
        title: Text(
          "Notifikasi",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: blackColor, fontSize: 18),
        ),
        actions: <Widget>[
          GFIconButton(
            onPressed: () {},
            type: GFButtonType.transparent,
            icon: Icon(
              Icons.delete,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
