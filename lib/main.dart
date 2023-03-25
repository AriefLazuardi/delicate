import 'package:belajar_flutter/pages/pertama/pertama.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
        routes: {
          "/pertama": (context) => Login(),
        });
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      body: ListView(
        children: [
          Text("Temukan masakan tepat untuk momen acaramu di Delicate"),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, "/pertama"),
              child: Text("Masuk")),
          Container(
            width: 314,
            height: 42,
            color: Color(0xffC21010),
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, "/login"),
                child: Text("Login")),
          )
        ],
      ),
    );
  }
}
