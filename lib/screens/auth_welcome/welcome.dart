// Premade libraries import
import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importing required custom screens
import 'package:watchmatchapp/screens/interface/home.dart';
import 'package:watchmatchapp/screens/auth_welcome/login.dart';
import 'package:watchmatchapp/screens/auth_welcome/register.dart';

// Importing custom widgets
import 'package:watchmatchapp/widgets/welcomeScreen/loginRegister.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  Future _login() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Future _register() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  checkLogin() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // Checking if user is logged in
    var isLoggedIn = storage.containsKey("token");
    if (isLoggedIn) {
      print("User is logged in");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    );

    return WillPopScope(
      onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            child: Stack(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/placeholder.png'),
                  ),
                  height: MediaQuery.of(context).size.height * 0.55,
                ),
                buttons(context, _register, _login),
              ],
            ),
          ),
        ),
    );
  }
}