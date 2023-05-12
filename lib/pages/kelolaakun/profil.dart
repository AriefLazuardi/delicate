import 'package:delicate/pages/Editprofil/edit_profil.dart';
import 'package:delicate/pages/changepassword/change_password.dart';
import 'package:delicate/pages/helpdesk/helpdesk.dart';
import 'package:delicate/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  get name => 'Dimas Zaidan';

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
                      margin: EdgeInsets.only(top: 10),
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: whiteColor,
                        child: SizedBox(
                          width: 300,
                          height: 82,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: const CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(""), //NetworkImage
                                    radius: 100,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '$name',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Nomor Telepon",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 35),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(Icons.person),
                      title: Text("Profil"),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfil(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 35),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.key_rounded,
                      ),
                      title: Text("Kata Sandi"),
                      trailing: Icon(Icons.navigate_next),
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 35),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(Icons.favorite),
                      title: Text("Favorit"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 35),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(Icons.feed),
                      title: Text("Riwayat Pembayaran"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 35),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(Icons.live_help),
                      title: Text("Pusat Bantuan"),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpDesk(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, "/login"),
                        child: Text(
                          "Keluar",
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
