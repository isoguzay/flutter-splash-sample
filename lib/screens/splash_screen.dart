import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goMainScreen();
  }

  // 5 seconds later -> onDoneControl
  Future<Timer> goMainScreen() async {
    return new Timer(Duration(seconds: 2), onDoneControl);
  }

  // route to MainScreen
  onDoneControl() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/flutterlogo.png'),),
              Image.asset('assets/flutterlogo.png'),
              Text("Splash Screen",
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 16)),
            ],
          ),
        ],
      )),
    );
  }
}
