import 'dart:async';

import 'package:bazar_updated/view/common_screen/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogin();
  }

  Future<void> isUserLogin() async {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen())));

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/splash_screen.png"),
        ),
      ),
    );
  }
}
