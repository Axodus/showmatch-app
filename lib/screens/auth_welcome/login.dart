// Premade libraries import
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:ShowMatch/screens/auth_welcome/register.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ShowMatch/components/buttons.dart';
import 'package:ShowMatch/helpers/preferences.dart';

// Importing required custom screens and scripts
import 'package:ShowMatch/screens/interface/home.dart';
import 'package:ShowMatch/helpers/helper.dart';

// Importing custom widgets

final emailController = TextEditingController();
final passwordController = TextEditingController();

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'DinNext',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'DinNext',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.blueGrey[300],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State < Login > {
  bool isKeyboardOpen = false;

  Widget _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: < Widget > [
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0, ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            cursorWidth: 2.5,
            cursorColor: Colors.white,
            controller: emailController,
            autofillHints: < String > [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "Enter your email address",
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _passwordField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60,
      child: TextField(
        cursorColor: Colors.white,
        cursorWidth: 2.5,
        controller: passwordController,
        autofillHints: < String > [AutofillHints.password],
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          hintText: "Enter your password",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  pushToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  Future _login() async {
    print("Hello");
    // Check if the fields are empty, if so displaying an error
    if ((passwordController.text.isEmpty) || (emailController.text.isEmpty)) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Dude put in some info pls"),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK")
              )
            ],
          );
        }
      );
    } else {
      print("Hello to you");
      // Mapping the data
      Map < String, String > loginData = {
        "email": emailController.text,
        "password": passwordController.text
      };
      print("Data has been spotted");

      var rsp = await postRequest(context, 'user/login/', loginData);
      
      Map < String, dynamic > rData = jsonDecode(rsp.body);
      print(rData);
      print(rData['token']);
      print(rsp.statusCode);

      if (rsp.statusCode == 200) {
        print("is 200 really ${rsp.statusCode}");

        defaultValues(rData['token'], context)
          .then((login) {
            print(rData['token']);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          });        
      } else if (rsp.statusCode == 400) {
        errorMessage(
          context,
          "Incorrect email or password"
        );
      } else {
        errorMessage(context);
      }
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    );

    return Scaffold(
      body: Stack(
        children: < Widget > [
          Container(
            color: Colors.blueGrey[600],
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0, vertical: 80.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  new Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Image.asset('assets/images/placeholder.png', height: 100,),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 3,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ],
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      " Sign in to continue ",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  _emailField(),
                  SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: < Widget > [
                      Text(
                        'Password',
                        style: kLabelStyle,
                      ),
                      SizedBox(height: 10.0),
                      _passwordField(),
                      //_forgotPassBtn(),
                    ],
                  ),
                  SizedBox(height: 15),
                  mainButton(
                    _login,
                    "LOGIN",
                    Alignment.bottomCenter,
                    450.0,
                    50.0,
                    Colors.white,
                    10.0,
                    18.0,
                    Colors.grey[600]
                  ),
                  SizedBox(height: 5),
                  mainButton(
                    pushToSignup,
                    "Sign Up",
                    Alignment.center,
                    100.0,
                    30.0,
                    Colors.blueGrey[900],
                    5.0,
                    14.0,
                    Colors.white
                  )
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}