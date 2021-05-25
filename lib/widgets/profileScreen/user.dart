import 'package:flutter/material.dart';

userCard(context, email, name) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    child: new Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        color: Colors.blueGrey[400],
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'DinNext',
                      fontSize: 26,
                      color: Colors.white
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
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