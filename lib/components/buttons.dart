import 'package:flutter/material.dart';
import 'dart:ui';

fabExtended(width, string, icon, backgroundColor, function, color, hero) {
  return Container(
    width: width,
    child: FloatingActionButton.extended(
      backgroundColor: backgroundColor,
      icon: icon,
      label: Text(
        string,
        style: TextStyle(
          color: color,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: function,
      heroTag: hero
    )
  );
}