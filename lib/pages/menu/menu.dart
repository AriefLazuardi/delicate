import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:delicate/pages/login/login.dart';
//import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:delicate/shared/shared.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(children: [
        Column(
          children: [
            // AnimSearchBar(
            // width: 400,
            // textController: textController,
            // onSuffixTap: , onSubmitted: (String ) {  },
            // )
          ],
        )
      ]),
    );
  }
}
