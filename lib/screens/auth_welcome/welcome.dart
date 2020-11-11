// Premade libraries import
import 'dart:async';
import 'dart:ui';
import 'package:ShowMatch/components/buttons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importing required custom screens
import 'package:ShowMatch/screens/interface/home.dart';
import 'package:ShowMatch/screens/auth_welcome/login.dart';
import 'package:ShowMatch/screens/auth_welcome/register.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  void initState() {
    super.initState();

    checkLogin();
  }

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
        MaterialPageRoute(builder: (context) => Home()),
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
            color: Colors.blueGrey[600],
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: new Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0),
                    child:Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/placeholder.png'),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    authButton(
                      _register,
                      "Sign Up",
                      Alignment.bottomCenter,
                      350.0,
                      45.0,
                      Colors.blueGrey[900],
                      10.0,
                      22.0,
                      Colors.white
                    ),
                    SizedBox(height: 15.0),
                    authButton(
                      _login,
                      "Login",
                      Alignment.bottomCenter,
                      350.0,
                      45.0,
                      Colors.white,
                      10.0,
                      22.0,
                      Colors.grey[600]
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}