import 'package:delicate/pages/kelolaakun/profil.dart';
import 'package:delicate/pages/menu/keranjang/keranjang.dart';
import 'package:delicate/pages/menu/menu.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notif',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profil',
          ),
        ],
        fixedColor: primaryColor,
      ),
    );
  }

// List listWidget = [
//   Profile(), Container(),Container(),Container()
// ];
  Widget getBody() {
    if (this.selectedIndex == 0) {
      return Menu();
    } else if (this.selectedIndex == 1) {
      return Keranjang();
    } else if (this.selectedIndex == 2) {
      return Container();
    } else if (this.selectedIndex == 3) {
      return Profile();
    } else {
      return Container();
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
