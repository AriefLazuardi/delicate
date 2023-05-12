import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text(
          'Pencarian',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: whiteColor,
        leading: GFIconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 25, 10, 0),
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
                //onTap: () => Navigator.pushNamed(context, "/pencarian"),
                readOnly: false,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Mau makanan yang gimana nih?',
                  prefixIcon: Icon(Icons.search, color: baseColor),
                  contentPadding: EdgeInsets.only(left: 35, right: 20),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Pernah kamu cari',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/lihat");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 45,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: baseColor,
                        ),
                        child: Text(
                          'kantin',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: baseColor,
                        ),
                        child: Text(
                          'rumah makan',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: baseColor,
                        ),
                        child: Text(
                          'ayam',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Berdasakan Kategori',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 45,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryColor)),
                        child: Text(
                          'terlaris',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Text(
                          'terdekat',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryColor)),
                        child: Text(
                          'ayam',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 45,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryColor)),
                        child: Text(
                          'makanan',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryColor)),
                        child: Text(
                          'aneka nasi',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 45,
                        margin: EdgeInsets.only(left: 15, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Text(
                          'bebek',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Populer saat ini',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 45,
                            margin: EdgeInsets.only(left: 20, top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: baseColor,
                            ),
                            child: Text(
                              'kantin',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 130,
                            height: 45,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: baseColor,
                            ),
                            child: Text(
                              'ayam geprek',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 45,
                            margin: EdgeInsets.only(left: 20, top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: baseColor,
                            ),
                            child: Text(
                              'cincau',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 125,
                            height: 45,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: baseColor,
                            ),
                            child: Text(
                              'kantin bu sri',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 45,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: baseColor,
                            ),
                            child: Text(
                              'air serbat',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
