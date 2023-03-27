import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomCenter,
                decoration: const  BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover)
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w800,
                              color: primaryColor),
                        ),
                        Text(
                          "Ketik yang bener ya!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: TextFormField(
                            decoration: InputDecoration(filled: true,fillColor: white,
                                border: OutlineInputBorder(borderSide: BorderSide(width: 0.5,color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: "Masukkan email/no hp"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            boxShadow:[
                            BoxShadow(color: Colors.black.withOpacity(0.3),offset: Offset(0,2),blurRadius: 5)
                          ] ),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: TextFormField(
                            decoration: InputDecoration(filled: true,fillColor: white,
                                border: OutlineInputBorder(borderSide: BorderSide(width: 0.5,color: Colors.grey.shade100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: "Masukkan password"),
                          ),
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () => Navigator.pushNamed(context, "/login"),
                              child: Text(
                                "Lupa password ?", style: TextStyle(color: primaryColor),
                              )),
                        )    
                      ],
                    ),
                   
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,), Column(
                      children: [
                        Container(
                          color: primaryColor,
                          width: 317,
                          height: 42,
                          child: TextButton(
                              onPressed: () => Navigator.pushNamed(context, "/login"),
                              child: Text(
                                "MASUK", style: TextStyle(color: white),
                              )),
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Atau masuk menggunakan",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2D2D2D)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        GestureDetector(
            onTap: () =>Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Image(image: AssetImage("assets/images/Vector.png"))),
          )    ],
          ),
        ],
      ),
    );
  }
}
