import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegulerMenu extends StatefulWidget {
  const RegulerMenu({super.key});

  @override
  State<RegulerMenu> createState() => _RegulerMenuState();
}

class _RegulerMenuState extends State<RegulerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("reguler"),
      ),
    );
  }
}
