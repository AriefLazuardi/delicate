import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/toko/toko.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/rendering.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  get textController => TextEditingController();
  List data = [
    {
      "rumah_makan": "RM Zulkarnai'in",
      "nama": "Sayur Nangka",
      "gambar": 'assets/images/sayur_nangka.png',
      //"lihat": "Lihat",
      "logo": "assets/images/vector_back.png"
    },
    {
      "rumah_makan": "Kedai Masakan Ayam",
      "nama": "Ayam Santan",
      "gambar": "assets/images/ayam_santan.png",
      //"lihat": "Lihat",
      "logo": "assets/images/vector_back.png"
    },
    {
      "rumah_makan": "RM Cahaya Busri",
      "nama": "Sayur Daun Ubi",
      "gambar": "assets/images/ayam_santan.png",
      // "lihat": "Lihat",
      "logo": "assets/images/vector_back.png"
    },
    {
      "rumah_makan": "Rumah Makan Kebumen",
      "nama": "Telor Dadar",
      "gambar": "assets/images/ayam_santan.png",
      // "lihat": "Lihat",
      "logo": "assets/images/vector_back.png"
    },
    {
      "rumah_makan": "Rumah Makan RBK",
      "nama": "RiceBowl Blackpepper",
      "gambar": "assets/images/ayam_santan.png",
      // "lihat": "Lihat",
      "logo": "assets/images/vector_back.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Image(
          image: AssetImage(
            "assets/images/delicate.png",
          ),
        ),
      ),
      body: ListView(children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: CupertinoSearchTextField(
                    borderRadius: BorderRadius.circular(200),
                    controller: textController,
                    placeholder: 'Mau makanan yang gimana nih?',
                    backgroundColor: whiteColor,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(32, 65, 0, 0),
                child: Text("Promo",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blackColor))),
            Container(
              margin: EdgeInsets.fromLTRB(28, 95, 10, 0),
              child: Image.asset(
                "assets/images/sop_bening.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60, 105, 10, 0),
              child: Text(
                "SOP BENING",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: whiteColor),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(61, 140, 10, 0),
              child: Text(
                "Diskon 20% per porsi",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(61, 167, 10, 0),
              color: primaryColor,
              width: 81,
              height: 27,
              child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/lihat"),
                  child: Text(
                    "Pesan sekarang",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 8,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(32, 260, 0, 0),
                child: Text("Coba cara lain",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: blackColor))),
            Container(
              margin: EdgeInsets.fromLTRB(28, 287, 28, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/regulermenu"),
                    child: Container(
                      child: Image(
                          image: AssetImage("assets/images/pil_regular.png")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/healthymenu"),
                    child: Container(
                      child: Image(
                          image: AssetImage("assets/images/pil_healthy.png")),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(32, 380, 0, 0),
                child: Text("Terlaris",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: blackColor))),
            Container(
              margin: EdgeInsets.fromLTRB(32, 412, 10, 0),
              width: 1080,
              height: 166.5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 166.5,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: baseColor,
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset("${data[index]?['gambar']}"),
                            Container(
                              height: 14,
                              alignment: Alignment.topLeft,
                              child: Expanded(
                                  child: Text(
                                "${data[index]?['rumah_makan']}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              )),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 14,
                              child: Expanded(
                                child: Text(
                                  "${data[index]?['nama']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              //alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(39, 0, 0, 0),
                                    child: TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, "/lihat"),
                                        child: Text(
                                          "Lihat",
                                          style: TextStyle(
                                              fontSize: 8, color: primaryColor),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Route route = MaterialPageRoute(
                                            builder: (context) => TokoPage());
                                        Navigator.push(context, route);
                                      },
                                      child: Container(
                                          //padding: EdgeInsets.all(5),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/vector_back.png"))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    );
                  }),
            )
          ],
        )
      ]),
    );
  }
}
