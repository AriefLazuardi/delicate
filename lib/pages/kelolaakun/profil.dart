import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Image(image: AssetImage("assets/images/delicate.png")),
      ),
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: whiteColor,
                        child: SizedBox(
                          width: 300,
                          height: 82,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: const CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(""), //NetworkImage
                                    radius: 100,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Nama Anda',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Nomor Telepon",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Profil",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Kata Sandi",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Favorit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Riwayat Pemesanan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              child: Text("Pusat Bantuan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, "/login"),
                        child: Text(
                          "Logout",
                          style: TextStyle(color: primaryColor),
                        )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
