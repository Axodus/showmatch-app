import 'package:ShowMatch/widgets/homeScreen/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  playTrailer(){
    
  }

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
                child: generateCard(context, playTrailer),
              )
            ],
          ),
        ),
      ),
    );
  }
}