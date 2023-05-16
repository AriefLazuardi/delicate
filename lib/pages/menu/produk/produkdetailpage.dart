import 'dart:convert';
import 'dart:async';
import 'package:delicate/shared/shared.dart';
import 'package:delicate/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../toko/tokoPage.dart';
import 'package:http/http.dart' as http;

class ProdukDetailPage extends StatefulWidget {
  final Widget child;
  final int id;
  final String nama_produk;
  final String deskripsi;
  final String harga;
  final String harga_int;
  final String satuan;
  final String gambar;
  final bool valstok;

  const ProdukDetailPage(
      {super.key,
      required this.child,
      required this.id,
      required this.nama_produk,
      required this.deskripsi,
      required this.harga,
      required this.harga_int,
      required this.satuan,
      required this.gambar,
      required this.valstok});

  @override
  State<ProdukDetailPage> createState() => _ProdukDetailPageState();
}

class _ProdukDetailPageState extends State<ProdukDetailPage> {
  bool instok = false;

  @override
  void initState() {
    super.initState();
    // fetchToko();
    if (widget.valstok == true) {
      instok = widget.valstok;
    }
  }

  @override
  void dispose() {
    super.dispose();
    // kategorilist = null;
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(widget.gambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:5.0), 
            child: Text(widget.nama_produk),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(widget.harga),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
