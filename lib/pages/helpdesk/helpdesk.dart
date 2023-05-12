import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:getwidget/getwidget.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({super.key});

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0,        
        title: (Text("Pusat Bantuan",style: TextStyle(fontSize: 14,color: blackColor,fontWeight: FontWeight.w600),)),
        leading: GFIconButton(
          icon: const Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
              margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
              decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: TextField(
                onTap: () => Navigator.pushNamed(context, "/pencarian"),
                readOnly: true,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Ada yang bisa dibantu?',
                  prefixIcon: Icon(Icons.search, color: baseColor),
                  contentPadding: EdgeInsets.only(left: 35, right: 35),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: new BorderSide(color: whiteColor),
                  ),
                  fillColor: whiteColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            ],
          )
        ],
      ),
    );
  }
}