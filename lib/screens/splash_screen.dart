import 'dart:async';

import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/pref.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _checkIfReady);
  }

  @override
  void initState() {
    AuthService.instance.isLoggedIn();
    SharedPref.instance.toString();
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }

  void _checkIfReady() {
    if (AuthService.instance.firebaseUser == null) {
      AuthService.instance.init().then((onValue) {
        _startActivity();
      });
    } else {
      _startActivity();
    }
  }

  void _startActivity() {
    if (AuthService.instance.isLoggedIn()) {
      Navigator.of(context).pushReplacementNamed("/homepage", arguments: 0);
    } else {
      Navigator.of(context).pushReplacementNamed("/welcome");
    }
  }
}
