import 'package:bazar_updated/viewmodel/buyer/buyer_services/check_user_login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  UserLogin userLogin = UserLogin ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLogin.isUserLogin(context);
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
