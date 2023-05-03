import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: whiteColor,
        leading: GFIconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
      ),
    );
  }
}
