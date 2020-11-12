import 'package:flutter/material.dart';

userCard(context, email) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    child: new Padding(
      padding: EdgeInsets.all(15.0),
      child: Card(
        color: Colors.blueGrey[400],
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  email,
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 26,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ],
        ),
      )
    ),
  );
}