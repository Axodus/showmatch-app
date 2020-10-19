import 'package:ShowMatch/widgets/homeScreen/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String trailerUrl = 'https://www.youtube.com/watch?v=uaaC57tcci0';
  
  playTrailer(){
    launch(trailerUrl);
  }

  onSwipe(){
    setState(() {
      trailerUrl = 'https://www.youtube.com/watch?v=lB95KLmpLR4';
    });
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
                child: GestureDetector(
                  onHorizontalDragEnd: onSwipe(),
                  child: generateCard(context, playTrailer),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}