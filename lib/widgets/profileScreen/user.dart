import 'package:flutter/material.dart';

userCard(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    child: new Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        color: Colors.blueGrey[400],
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      )
    ),
  );
}