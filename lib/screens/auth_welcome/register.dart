// Premade libraries import
import 'dart:async';
import 'dart:ui';
import 'package:ShowMatch/components/buttons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// Importing required custom screens
import 'package:ShowMatch/screens/interface/home.dart';
import 'package:ShowMatch/screens/auth_welcome/login.dart';

// Importing custom widgets
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State < Register > {

  pushToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[600],
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Getting an account is only",
                      style: TextStyle(
                        fontFamily: 'DinNext',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "available by contacting the",
                      style: TextStyle(
                        fontFamily: 'DinNext',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "system administrator",
                      style: TextStyle(
                        fontFamily: 'DinNext',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                mainButton(
                  pushToLogin,
                  "LOGIN INSTEAD",
                  Alignment.bottomCenter,
                  350.0,
                  45.0,
                  Colors.white,
                  10.0,
                  22.0,
                  Colors.grey[600]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}