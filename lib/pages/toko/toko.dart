import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TokoPage extends StatefulWidget {
  const TokoPage({super.key});

  @override
  State<TokoPage> createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
  Map stores = {
    "name": 'Warung Teteh',
    "address": 'A Yani Sengkubang',
    "category": 'Ayam & Sapi, Nasi Goreng',
    "imageUrl": 'assets/images/toko_avatar.png',
    "bintang": '4.7',
    "rating": '100+',
    "makanan": [
      {
        "id": 1,
        "nama_makanan": "Ayam Kalasan",
        "gambar": "assets/images/ayam_kalasan.png",
        "harga": "Rp.17.000/Porsi",
        "kategori": "Reguler"
      },
      {
        "id": 2,
        "nama_makanan": "Sate Ayam",
        "gambar": "assets/images/sate_ayam.png",
        "harga": "Rp.2.500/Tusuk",
        "kategori": "Healthy"
      },
      {
        "id": 3,
        "nama_makanan": "Ayam Kalasan",
        "harga": "Rp.17.000/Porsi",
        "gambar": "assets/images/ayam_kalasan.png",
        "kategori": "Reguler"
      },
      {
        "id": 4,
        "nama_makanan": "Ayam Kalasan",
        "harga": "Rp.17.000/Porsi",
        "gambar": "assets/images/ayam_kalasan.png",
        "kategori": "Reguler"
      },
      {
        "id": 5,
        "nama_makanan": "Ayam Kalasan",
        "harga": "Rp.17.000/Porsi",
        "gambar": "assets/images/ayam_kalasan.png",
        "kategori": "Reguler"
      },
      {
        "id": 6,
        "nama_makanan": "Ayam Kalasan",
        "harga": "Rp.17.000/Porsi",
        "gambar": "assets/images/ayam_kalasan.png",
        "kategori": "Reguler"
      },
    ],
    "minuman": [
      {
        "id": 1,
        "nama_minuman": "Jeruk Peras",
        "gambar": "assets/images/jeruk_peras.png",
        "harga": "Rp.8.000/Gelas",
        "kategori": "Reguler"
      },
      {
        "id": 2,
        "nama_minuman": "Air Serbat",
        "gambar": "assets/images/air_serbat.png",
        "harga": "Rp.10.000/Gelas",
        "kategori": "Healthy"
      },
      {
        "id": 3,
        "nama_minuman": "Air Serbat",
        "harga": "Rp.10.000/Gelas",
        "gambar": "assets/images/air_serbat.png",
        "kategori": "Healthy"
      },
      {
        "id": 4,
        "nama_minuman": "Jeruk Peras",
        "harga": "Rp.8.000/Gelas",
        "gambar": "assets/images/jeruk_peras.png",
        "kategori": "Reguler"
      },
      {
        "id": 5,
        "nama_minuman": "Jeruk Peras",
        "harga": "Rp.8.000/Gelas",
        "gambar": "assets/images/jeruk_peras.png",
        "kategori": "Reguler"
      },
      {
        "id": 6,
        "nama_minuman": "Jeruk Peras",
        "harga": "Rp.10.00/Gelas",
        "gambar": "assets/images/jeruk_peras.png",
        "kategori": "Healthy"
      },
    ],
  };

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
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 90,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(stores['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${stores['name']} - ${stores['address']}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 0),
                              Text(
                                stores['category'],
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
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
                                    stores['bintang'],
                                    style: const TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    stores['rating'],
                                    style: const TextStyle(
                                        fontSize: 8,
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Column(
                  children: stores["makanan"].map<Widget>((e) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TokoPage())),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(e['gambar']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['nama_makanan'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            e['harga'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: e['kategori'] ==
                                                            'Reguler'
                                                        ? primaryColor
                                                        : healthyColor,
                                                    width: 1)),
                                            child: Text(
                                              e['kategori'] != null &&
                                                      e['kategori'] != ''
                                                  ? e['kategori']
                                                  : '-',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color:
                                                      e['kategori'] == 'Reguler'
                                                          ? primaryColor
                                                          : healthyColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.favorite_border_outlined),
                                        iconSize: 18,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 180, top: 26),
                                    width: 50,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: primaryColor),
                                    child: Text(
                                      'Tambah',
                                      style: TextStyle(
                                          fontSize: 8, color: whiteColor),
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Column(
                  children: stores["minuman"].map<Widget>((e) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TokoPage())),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(e['gambar']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['nama_minuman'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            e['harga'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: e['kategori'] ==
                                                            'Reguler'
                                                        ? primaryColor
                                                        : healthyColor,
                                                    width: 1)),
                                            child: Text(
                                              e['kategori'] != null &&
                                                      e['kategori'] != ''
                                                  ? e['kategori']
                                                  : '-',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color:
                                                      e['kategori'] == 'Reguler'
                                                          ? primaryColor
                                                          : healthyColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.favorite_border_outlined),
                                        iconSize: 18,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 180, top: 26),
                                    width: 50,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: primaryColor),
                                    child: Text(
                                      'Tambah',
                                      style: TextStyle(
                                          fontSize: 8, color: whiteColor),
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
