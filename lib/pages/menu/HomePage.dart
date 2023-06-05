import 'dart:convert';
import 'package:delicate/pages/login/login.dart';
import 'package:delicate/pages/menu/category/reguler.dart';
import 'package:delicate/pages/toko/tokoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter/services.dart';

import '../../models/Toko.dart';
import '../../shared/constant.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MenuState();
}

class _MenuState extends State<HomePage> {
  get textController => TextEditingController();
  List<Toko>? kategorilist = [];

  List<Toko> tokoList = [];
  fetchKategori({String? kategori}) async {
    var params = "/tokobyreguler/terlaris";
    debugPrint("$kategori");
    try {
      var url = Palatte.sUrl + params;
      debugPrint("$url");
      var jsonResponse = await http.get(Uri.parse(url));
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
        debugPrint("JSON BODY ${jsonResponse.body}");
        tokoList = jsonItems.map<Toko>((json) {
          return Toko.fromJson(json);
        }).toList();

        // setState(() {
        //   kategorilist == usersList;
        // });
        setState(() {});
      }
    } catch (e) {
      // usersList = kategorilist;
      debugPrint("ERROR HERE $e");
    }
  }

  Future<Null> _refresh() {
    return fetchKategori().then((_kategori) {});
  }

  @override
  void initState() {
    super.initState();
    fetchKategori();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('Ingin keluar dari App?'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Tidak'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Ya'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
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
        body: ListView(
            padding: EdgeInsets.only(bottom: 100),
            physics: BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: TextField(
                      onTap: () => Navigator.pushNamed(context, "/pencarian"),
                      readOnly: true,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: 'Mau makanan yang gimana nih?',
                        prefixIcon: Icon(Icons.search, color: baseColor),
                        contentPadding: EdgeInsets.only(left: 35, right: 35),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: new BorderSide(color: whiteColor),
                        ),
                        fillColor: whiteColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
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
                          onTap: () =>
                              Navigator.pushNamed(context, "/regulermenu"),
                          child: Container(
                            child: Image(
                                image: AssetImage(
                                    "assets/images/pil_regular.png")),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, "/healthymenu"),
                          child: Container(
                            child: Image(
                                image: AssetImage(
                                    "assets/images/pil_healthy.png")),
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
                    // width: 1080,
                    height: 180,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tokoList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            clipBehavior: Clip.hardEdge,
                            width: 120,
                            height: 160,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: baseColor,
                                )),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, "/lihat"),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Image.asset(tokoList[index].gambar ?? ""),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 4, left: 4),
                                        child: Text(
                                          tokoList[index].nama ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          tokoList[index].deskripsi ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, "/lihat"),
                                      child: Container(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                child: Text(
                                              "Lihat",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: primaryColor),
                                            )),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: Container(
                                                  //padding: EdgeInsets.all(5),
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/images/vector_back.png"))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        }),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
