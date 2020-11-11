import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget{
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'DinNext'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}