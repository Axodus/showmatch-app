import 'package:ShowMatch/widgets/profileScreen/appVer.dart';
import 'package:ShowMatch/widgets/profileScreen/qrCard.dart';
import 'package:ShowMatch/widgets/profileScreen/user.dart';
import 'package:flutter/material.dart';

import '../../components/buttons.dart';

class UserProfile extends StatefulWidget{
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  String uID = '0f5w-a8c5-b9g7-ec9s';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.blueGrey[600],
          child: ListView(
            children: [
              userCard(context),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Divider(
                  color: Colors.blueGrey[900],
                  height: 5,
                ),
              ),
              qrCard(context, uID),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: mainButton(
                  () {},
                  "JOIN PARTY",
                  Alignment.center,
                  MediaQuery.of(context).size.width,
                  50.0,
                  Colors.blueGrey[400],
                  10.0,
                  22.0,
                  Colors.white
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Divider(
                  color: Colors.blueGrey[900],
                  height: 5,
                ),
              ),
              appVer(context),
              SizedBox(height: 10.0)
            ],
          ),
        ),
      ),
    );
  }
}