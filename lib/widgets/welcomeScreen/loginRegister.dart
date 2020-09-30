import 'package:flutter/material.dart';
import 'package:ShowMatch/components/buttons.dart';

buttons(context, register, login){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: fabExtended(
                MediaQuery.of(context).size.width * 0.8,
                "Register",
                null,
                Colors.blue,
                register,
                Colors.white,
                "Register"
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: fabExtended(
                MediaQuery.of(context).size.width * 0.8,
                "Login",
                null,
                Colors.white,
                login,
                Colors.black,
                "Login"
              ),
            ),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.2,
    ),
  );
}