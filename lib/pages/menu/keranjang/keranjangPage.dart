import 'dart:ffi';

import 'package:delicate/helper/dbhelper.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:delicate/models/keranjang.dart';
import 'package:delicate/pages/toko/tokoPage.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangState();
}

class _KeranjangState extends State<KeranjangPage> {
  DbHelper dbHelper = DbHelper();
  List<Keranjang> keranjangList = [];
  bool keranjang = false;
  List data = [
    {
      "toko": "RM Zulkarnai'in",
      "nama_menu": "Sayur Nangka",
      "gambar": 'assets/images/sayur_nangka.png',
    },
    {
      "toko": "Kedai Masakan Ayam",
      "nama_menu": "Ayam Santan",
      "gambar": "assets/images/ayam_santan.png",
    },
    {
      "toko": "RM Cahaya Busri",
      "nama_menu": "Sayur Daun Ubi",
      "gambar": "assets/images/ayam_santan.png",
    },
    {
      "toko": "Rumah Makan Kebumen",
      "nama_menu": "Telor Dadar",
      "gambar": "assets/images/ayam_santan.png",
    },
    {
      "toko": "Rumah Makan RBK",
      "nama_menu": "RiceBowl Blackpepper",
      "gambar": "assets/images/ayam_santan.png",
    },
  ];
  Widget tampilanKeranjang() {
    if (keranjang == false) {
      // pengecekan apakah list kosong atau tidak
      return Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 190, 20, 0),
            child: Image(
              image: AssetImage("assets/images/keranjang0.png"),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Text(
              "Keranjangmu masih kosong nih",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      );
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: data.map((e) {
            return Container(
              width: 100,
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CheckboxExample(),
                      CircleAvatar(
                        radius: 10,
                        backgroundImage:
                            AssetImage("assets/images/toko_avatar.png"),
                      ),
                      Container(child: Text("Papa Min"))
                    ],
                  ),
                  Row(
                    children: [
                      Container(child: CheckboxExample()),
                      Container(
                        width: 50,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage("assets/images/sate_ayam.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text("Nama_produk"),
                          ),
                          Container(
                            child: Text("Rp. 17.000"),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
      titleSpacing: 0,
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
      title: Text(
        "Keranjang",
        style: TextStyle(
            color: blackColor, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    ));
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
