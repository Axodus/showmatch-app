import 'package:flutter/material.dart';

qrCard(context, uID) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.6,
    child: new Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        color: Colors.blueGrey[400],
        elevation: 8,
        child: Column(
          children: [
            new Padding(
              padding: EdgeInsets.all(25.0),
              child: new Image.asset('assets/images/qr.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  uID,
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 22,
                    color: Colors.white
                  ),
                )
              ],
            )
          ],
        ),
      )
    ),
  );
}