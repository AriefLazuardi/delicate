import 'dart:convert';

import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/Produk.dart';
import '../../shared/constant.dart';

class TokoPage extends StatefulWidget {
  final int? id;
  const TokoPage({super.key, this.id});

  @override
  State<TokoPage> createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
  ModelToko data = ModelToko();
  bool loading = true;
  getData() async {
    if (widget.id != null) {
      await http
          .get(Uri.parse(Palatte.sUrl + "/showAllToko/${widget.id}"))
          .then((v) {
        var rawData = jsonDecode(v.body);
        debugPrint("$rawData");
        data = ModelToko.fromJson(rawData);
        debugPrint("ITEMM ${data.toko?.first}");
        loading = false;
        setState(() {});
      }).catchError((e) {
        loading = false;
        setState(() {});
        debugPrint("$e");
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: GFIconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.grey.shade600,
            onPressed: () {
              Navigator.pop(context);
            },
            type: GFButtonType.transparent,
          ),
          actions: <Widget>[
            GFIconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              type: GFButtonType.transparent,
            ),
            GFIconButton(
              onPressed: () {},
              type: GFButtonType.transparent,
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : (data.toko ?? []).isEmpty
                ? Center(child: Text("Data Kosong!"))
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 140,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(top: 5, left: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "${data.toko?[0]?.gambar}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.toko?[0]?.nama} - ${data.toko?[0]?.alamat}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 0),
                                        Text(
                                          data.toko?[0]?.deskripsi ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "${data.toko?[0]?.bintang ?? 0}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${data.toko?[0]?.jumlahUlasan ?? 0}+",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Makanan',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          if ((data.makanan ?? []).isEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Belum ada makanan"),
                              alignment: Alignment.center,
                            )
                          else
                            Column(
                              children: (data.makanan ?? []).map<Widget>((e) {
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 300,
                                                height: 210,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        e?.gambar ?? ""),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      e?.namaProduk ?? "",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 45),
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons
                                                          .favorite_border_outlined),
                                                      iconSize: 20,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 45),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  e?.deskripsi ?? "",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 45),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${e?.harga ?? ""} /${e?.satuan ?? ""}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 70),
                                                    alignment: Alignment.center,
                                                    width: 70,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color: (e?.kategori ??
                                                                        "") ==
                                                                    'Reguler'
                                                                ? primaryColor
                                                                : healthyColor,
                                                            width: 1)),
                                                    child: Text(
                                                      (e?.kategori ?? "") !=
                                                                  null &&
                                                              (e?.kategori ??
                                                                      "") !=
                                                                  ''
                                                          ? (e?.kategori ?? "")
                                                          : '-',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: (e?.kategori ??
                                                                      "") ==
                                                                  'Reguler'
                                                              ? primaryColor
                                                              : healthyColor),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 70,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: primaryColor),
                                                    child: Text(
                                                      'Tambah',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(top: 5, left: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      (e?.gambar ?? "")),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        (e?.namaProduk ?? ""),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${(e?.harga ?? "")} /${(e?.satuan ?? "")}",
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: (e?.kategori ??
                                                                            "") ==
                                                                        'Reguler'
                                                                    ? primaryColor
                                                                    : healthyColor,
                                                                width: 1)),
                                                        child: Text(
                                                          (e?.kategori ?? "") !=
                                                                      null &&
                                                                  (e?.kategori ??
                                                                          "") !=
                                                                      ''
                                                              ? (e?.kategori ??
                                                                  "")
                                                              : '-',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: (e?.kategori ??
                                                                          "") ==
                                                                      'Reguler'
                                                                  ? primaryColor
                                                                  : healthyColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .favorite_border_outlined),
                                                    iconSize: 24,
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 1),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: 180, top: 26),
                                                  width: 150,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: primaryColor),
                                                  child: Text(
                                                    'Tambah',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: whiteColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Minuman',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          if ((data.minuman ?? []).isEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Belum ada minuman"),
                              alignment: Alignment.center,
                            )
                          else
                            Column(
                              children: (data.minuman ?? []).map<Widget>((e) {
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 300,
                                                height: 210,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        (e?.gambar ?? "")),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      (e?.namaProduk ?? ""),
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 45),
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons
                                                          .favorite_border_outlined),
                                                      iconSize: 20,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 45),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  (e?.deskripsi ?? ""),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 45),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${(e?.harga ?? "")} /${(e?.satuan ?? "")}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 70),
                                                    alignment: Alignment.center,
                                                    width: 70,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color: (e?.kategori ??
                                                                        "") ==
                                                                    'Reguler'
                                                                ? primaryColor
                                                                : healthyColor,
                                                            width: 1)),
                                                    child: Text(
                                                      (e?.kategori ?? "") !=
                                                                  null &&
                                                              (e?.kategori ??
                                                                      "") !=
                                                                  ''
                                                          ? (e?.kategori ?? "")
                                                          : '-',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: (e?.kategori ??
                                                                      "") ==
                                                                  'Reguler'
                                                              ? primaryColor
                                                              : healthyColor),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 70,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: primaryColor),
                                                      child: Text(
                                                        'Tambah',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: whiteColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(top: 5, left: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      (e?.gambar ?? "")),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        (e?.namaProduk ?? ""),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        (e?.harga ?? ""),
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                color: (e?.kategori ??
                                                                            "") ==
                                                                        'Reguler'
                                                                    ? primaryColor
                                                                    : healthyColor,
                                                                width: 1)),
                                                        child: Text(
                                                          (e?.kategori ?? "") !=
                                                                      null &&
                                                                  (e?.kategori ??
                                                                          "") !=
                                                                      ''
                                                              ? (e?.kategori ??
                                                                  "")
                                                              : '-',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: (e?.kategori ??
                                                                          "") ==
                                                                      'Reguler'
                                                                  ? primaryColor
                                                                  : healthyColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .favorite_border_outlined),
                                                    iconSize: 24,
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 1),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    left: 180, top: 26),
                                                width: 170,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: primaryColor),
                                                child: Text(
                                                  'Tambah',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: whiteColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    ],
                  ));
  }
}
