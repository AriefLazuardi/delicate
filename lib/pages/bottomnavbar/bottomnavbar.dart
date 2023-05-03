import 'package:delicate/pages/kelolaakun/profil.dart';
import 'package:delicate/pages/menu/keranjang/keranjang.dart';
import 'package:delicate/pages/menu/HomePage.dart';
import 'package:delicate/pages/notifikasi/notifikasi.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _pageIndex = 0;
  final List<Widget> _tablist = [
    const HomePage(),
    const Keranjang(),
    const Notifikasi(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _tablist.elementAt(_pageIndex),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: const Alignment(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  selectedItemColor: whiteColor,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: whiteColor,
                  currentIndex: _pageIndex,
                  onTap: (int index) {
                    _pageIndex = index;
                    setState(() {});
                  },
                  items: <dynamic>[
                    {
                      "title": "Home",
                      "icon": Icons.home,
                    },
                    {
                      "title": "Keranjang",
                      "icon": Icons.shopping_bag,
                    },
                    {
                      "title": "Notifikasi",
                      "icon": Icons.notifications,
                    },
                    {
                      "title": "Profil",
                      "icon": Icons.person,
                    },
                  ]
                      .asMap()
                      .entries
                      .map(
                        (e) => BottomNavigationBarItem(
                          icon: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: _pageIndex != e.key
                                    ? whiteColor
                                    : primaryColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(e.value['icon']),
                          ),
                          label: "${e.value['title']}",
                        ),
                      )
                      .toList(),
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
