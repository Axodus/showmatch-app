// Premade libraries import
import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// Importing required custom screens
import 'package:watchmatchapp/screens/interface/home.dart';
import 'package:watchmatchapp/screens/auth_welcome/login.dart';
import 'package:watchmatchapp/screens/auth_welcome/register.dart';

// Importing custom widgets
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("IT WORKS"),
              )
            ],
          ),
        ),
      ),
    );
  }
}