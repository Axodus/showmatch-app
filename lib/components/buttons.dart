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
          fontFamily: 'DinNext',
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: function,
      heroTag: hero
    )
  );
}

mainButton(function, string, align, width, height, color, borderRad, fontSize, fontColor) {
  return Container(
    width: width,
    height: height,
    child: Align(
      alignment: align,
      child: ButtonTheme(
        buttonColor: color,
        minWidth: width,
        height: height,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRad)
          ),
          onPressed: function,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              string,
              style: TextStyle(
                color: fontColor,
                fontFamily: 'DinNext',
                fontSize: fontSize
              ),
            ),
          )
        ),
      )
    ),
  );
}