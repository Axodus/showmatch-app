// Premade libraries import
import 'dart:ui';
import 'package:ShowMatch/screens/interface/ChatPage.dart';
import 'package:ShowMatch/screens/interface/homeScreen.dart';
import 'package:ShowMatch/screens/interface/profile.dart';
import 'package:flutter/material.dart';

// Importing custom widgets
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  final List < Widget > _children = [
    HomeScreen(),
    ChatPage(),
    UserProfile()
  ];

  void _onItemTapped (int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context){
    
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const < BottomNavigationBarItem > [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
        ],
        currentIndex: currentIndex,
        backgroundColor: Colors.blueGrey[700],
        selectedItemColor: Color.fromRGBO(172, 232, 148, 1.0),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}