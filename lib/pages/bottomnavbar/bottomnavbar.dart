import 'package:delicate/pages/kelolaakun/profil.dart';
import 'package:delicate/pages/menu/keranjang/keranjangPage.dart';
import 'package:delicate/pages/menu/HomePage.dart';
import 'package:delicate/pages/notifikasi/notifikasi.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  // final Widget child;
  // final String nav;
  // const BottomNavbar({super.key, required this.child, required this.nav});
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _pageIndex = 0;
  final List<Widget> _tablist = [
    const HomePage(),
    KeranjangPage(),
    const Notifikasi(),
    const Profile()
  ];

  // @override
  // void initState() {
  //   super.initState();

  //   if (widget.nav == "1") {
  //     _pageIndex = 1;
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageIndex = 0;
  // }

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
                          icon: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
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
