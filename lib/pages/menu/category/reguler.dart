import 'package:delicate/pages/filter/filterdialog.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../toko/toko.dart';
import 'selected_list_controller.dart';
import 'package:filter_list/filter_list.dart';

class Store {
  final String name;
  final String address;
  final String category;
  final String imageUrl;

  Store(
      {required this.name,
      required this.address,
      required this.category,
      required this.imageUrl});
}

class RegulerMenu extends StatefulWidget {
  @override
  State<RegulerMenu> createState() => _RegulerMenuState();
}

class _RegulerMenuState extends State<RegulerMenu> {
  dynamic top = 0;
  Filter? selectedFilter;

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

  // @override
  // void initState() {
  //   _focusNodes = Iterable<int>.generate(3).map((e) => FocusNode()).toList();

  //   _focusNodes[0].requestFocus();
  // }

  Set<int> _groupValues = {};

  List<FocusNode>? _focusNodes;

  @override
  void initState() {
    super.initState();
    _groupValues.add(1);
    _focusNodes = List.generate(8, (_) => FocusNode());
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
              // Container(
              //   width: 100,
              //   margin: EdgeInsets.only(right: 100),
              //   padding: EdgeInsets.zero,
              //   child: Divider(
              //     thickness: 1,
              //     color: baseColor,
              //   ),
              // ),
            ]),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        selected: _groupValues.contains(value),
      ),
    );
  }

  final List<Store> stores = [
    Store(
        name: 'Kantin Bu Sri',
        address: 'Jalan Alianyang No.25',
        category: 'Ayam & Sop Bening',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Warung Teteh',
        address: 'A Yani Sengkubang',
        category: 'Ayam & Sapi, Nasi Goreng',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Cahaya',
        address: 'Sungai Raya Dalam',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Sate Sejahtera',
        address: 'Jalan Sejahtera',
        category: 'Sate Ayam & Sapi',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Melda',
        address: 'Jl. Tanjungpure No. 99',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Zakaria',
        address: 'Jl. Sultan Abdurrahman',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Batas Kota',
        address: 'Jl. H.R A. Rahman',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Sugeng',
        address: 'Jl. Jeranding',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Ayam Penyet Pegasus',
        address: 'Jl. Gusti Hamza No.99',
        category: 'Aneka Ayam dan daging',
        imageUrl: 'assets/images/toko_avatar.png'),
    Store(
        name: 'Rumah Makan Rio',
        address: 'Jl. Merdeka Barat',
        category: 'Aneka Lauk & Sayur',
        imageUrl: 'assets/images/toko_avatar.png'),
  ];

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
              // print('constraints=' + constraints.toString());
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
              padding: EdgeInsets.all(8.0),
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: baseColor),
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            builder: (context) => StatefulBuilder(
                              builder: ((context, setState) {
                                return SizedBox(
                                  height: 460,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            left: 14.4, top: 10),
                                        child: Text(
                                          "Jenis Kuliner",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          _buildItem("Semua Kuliner", 1,
                                              _focusNodes![0]),
                                          _buildItem(
                                              "Makanan", 2, _focusNodes![1]),
                                          _buildItem(
                                              "Aneka nasi", 3, _focusNodes![2]),
                                          _buildItem(
                                              "Ayam", 4, _focusNodes![3]),
                                          _buildItem(
                                              "Sapi", 5, _focusNodes![4]),
                                          _buildItem(
                                              "Sayuran", 6, _focusNodes![5]),
                                          _buildItem(
                                              "Bakso", 7, _focusNodes![6]),
                                          _buildItem("Aneka Minuman", 8,
                                              _focusNodes![7]),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                        icon: Icon(Icons.tune),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                      )),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: baseColor),
                    child: Center(
                      child: Text(
                        'Terlaris',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: baseColor),
                    child: Center(
                      child: Text(
                        'Bintang 4.5+',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: baseColor),
                    child: Center(
                      child: Text(
                        'Kuliner',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: baseColor),
                    child: Center(
                      child: Text(
                        'Terlaris',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/lihat"),
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
                                  image: AssetImage(stores[index].imageUrl),
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
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700),
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
                                "${stores[index].name} - ${stores[index].address}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                stores[index].category,
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
                  ),
                );
              },
              childCount: stores.length,
            ),
          )
        ],
      ),
    );
  }
}
