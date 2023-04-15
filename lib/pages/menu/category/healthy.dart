import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../shared/shared.dart';

class HealthyMenu extends StatefulWidget {
  const HealthyMenu({super.key});

  @override
  State<HealthyMenu> createState() => _HealthyState();
}

class _HealthyState extends State<HealthyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(39, 150, 0, 0),
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, "/bottomnavbars"),
            child: Text(
              "coba",
              style: TextStyle(fontSize: 20, color: primaryColor),
            )),
      ),
    );
  }
}
