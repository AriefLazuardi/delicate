import 'dart:convert';
import 'dart:async';

import 'package:delicate/models/Toko.dart';
import 'package:delicate/pages/filter/filterdialog.dart';
import 'package:delicate/shared/shared.dart';
import 'package:delicate/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../toko/tokoPage.dart';
import 'selected_list_controller.dart';
import 'package:filter_list/filter_list.dart';
import 'package:http/http.dart' as http;

class RegulerMenu extends StatefulWidget {
  @override
  State<RegulerMenu> createState() => _RegulerMenuState();
}

class _RegulerMenuState extends State<RegulerMenu> {
  List<Toko>? kategorilist = [];

  List<Toko> tokoList = [];
  fetchKategori({String? kategori}) async {
    var params = "/tokobyreguler";
    debugPrint("$kategori");
    if (kategori == "Bintang 4.5+") {
      params = params + "/rating";
    } else if (kategori != null) {
      params = params + "/" + "$kategori".toLowerCase();
    }
    // else if (kategori == "Bintang 4.5") {
    //   params = params + "/rating";
    // }
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

  List<String> kategori = [
    "Terdekat",
    "Bintang 4.5+",
    "Kuliner",
    "Pickup",
    "Terlaris",
  ];
  List<IconData> isikategori = [
    Icons.home,
    Icons.favorite,
    Icons.arrow_back,
    Icons.person,
    Icons.label,
  ];

  int current = -1;

  dynamic top = 0;
  Filter? selectedFilter;

  bool _isPressed = false;

  List<Widget> createRadioListFilter() {
    List<Filter> filters = Filter.getFilters();
    return filters
        .map((filter) => Radio(
              value: filter,
              groupValue: selectedFilter,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (currentFilter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
              activeColor: primaryColor,
            ))
        .toList();
  }

  Set<int> _groupValues = {};

  List<FocusNode>? _focusNodes;

  @override
  void initState() {
    super.initState();
    fetchKategori();
    // _groupValues.add(1);
    // _focusNodes = List.generate(8, (_) => FocusNode());
  }

  @override
  void dispose() {
    super.dispose();
    kategorilist = null;
  }

  Widget _buildItem(String text, int value, FocusNode focusNode) {
    return Container(
      height: 40,
      child: ListTile(
        //controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          text,
          style: TextStyle(
              fontSize: 10,
              color:
                  _groupValues.contains(value) ? Colors.black : Colors.black),
        ),
        //controlAffinity: ListTileControlAffinity.trailing,
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              if (_groupValues.contains(value)) {
                _groupValues.remove(value);
              } else {
                _groupValues.add(value);
              }
            });
          },
          child: SizedBox(
            width: 80.0,
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Radio<int>(
                      groupValue: _groupValues.contains(value) ? value : null,
                      value: value,
                      onChanged: (int? newValue) {
                        setState(() {
                          if (newValue != null) {
                            if (_groupValues.contains(newValue)) {
                              _groupValues.remove(newValue);
                            } else {
                              _groupValues.add(newValue);
                            }
                          }
                        });
                      },
                      activeColor: primaryColor,
                      splashRadius: 25,
                      toggleable: true,
                      visualDensity:
                          const VisualDensity(horizontal: -1, vertical: -1),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      focusNode: focusNode,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        selected: _groupValues.contains(value),
      ),
    );
  }

  Widget createListToko() {
    if (tokoList.length == 0) {
      return SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.2,
              child: CircularProgressIndicator()));
    }
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/lihattoko"),
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      if (tokoList[index].gambar != null)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(tokoList[index].gambar ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(left: 38.0, top: 92.0),
                        width: 23,
                        height: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1),
                                  blurRadius: 1)
                            ]),
                        child: Row(
                          children: [
                            Text(
                              '4.7',
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${tokoList[index].nama} -  ${tokoList[index].alamat}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${tokoList[index].deskripsi}",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      childCount: tokoList.length,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            pinned: true,
            backgroundColor: primaryColor,
            expandedHeight: 150,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;

              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Reguler',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        if (top > 125)
                          const Text(
                            'Biasa aja tapi yang pasti enak!',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                      ],
                    ),
                  ),
                  background: Container(
                    padding: const EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/reguler_menu.png",
                            ),
                            fit: BoxFit.cover)),
                    height: 150,
                  ));
            }),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 35,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTapDown: (TapDownDetails details) {
                            setState(() {
                              _isPressed = true;
                            });
                          },
                          onTapUp: (TapUpDetails details) {
                            setState(() {
                              _isPressed = false;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              _isPressed = false;
                            });
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: current == OnTap
                                      ? primaryColor
                                      : baseColor),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/lihattoko");
                                },
                                icon: Icon(Icons.tune),
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                              )),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: kategori.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                    fetchKategori(kategori: kategori[current]);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: current == index
                                          ? primaryColor
                                          : baseColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: index == 2
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                kategori[index],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: current == index
                                                        ? whiteColor
                                                        : blackColor),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: current == index
                                                    ? whiteColor
                                                    : blackColor,
                                                size: 20,
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Text(
                                              kategori[index],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: current == index
                                                      ? whiteColor
                                                      : blackColor),
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ,ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     Container(
              //         width: 50,
              //         height: 25,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(30),
              //             color: baseColor),
              //         child: IconButton(
              //           onPressed: () {
              //             showModalBottomSheet(
              //               context: context,
              //               isDismissible: true,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(10)),
              //               builder: (context) => StatefulBuilder(
              //                 builder: ((context, setState) {
              //                   return SizedBox(
              //                     height: 460,
              //                     child: Column(
              //                       children: [
              //                         Container(
              //                           alignment: Alignment.centerLeft,
              //                           padding: EdgeInsets.only(
              //                               left: 14.4, top: 10),
              //                           child: Text(
              //                             "Jenis Kuliner",
              //                             style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.w500,
              //                             ),
              //                           ),
              //                         ),
              //                         Column(
              //                           children: [
              //                             _buildItem("Semua Kuliner", 1,
              //                                 _focusNodes![0]),
              //                             _buildItem(
              //                                 "Makanan", 2, _focusNodes![1]),
              //                             _buildItem(
              //                                 "Aneka nasi", 3, _focusNodes![2]),
              //                             _buildItem(
              //                                 "Ayam", 4, _focusNodes![3]),
              //                             _buildItem(
              //                                 "Sapi", 5, _focusNodes![4]),
              //                             _buildItem(
              //                                 "Sayuran", 6, _focusNodes![5]),
              //                             _buildItem(
              //                                 "Bakso", 7, _focusNodes![6]),
              //                             _buildItem("Aneka Minuman", 8,
              //                                 _focusNodes![7]),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   );
              //                 }),
              //               ),
              //             );
              //           },
              //           icon: Icon(Icons.tune),
              //           padding: EdgeInsets.zero,
              //           alignment: Alignment.center,
              //         )),
              //
            ),
          ),
          createListToko(),
        ],
      ),
    );
  }
}
