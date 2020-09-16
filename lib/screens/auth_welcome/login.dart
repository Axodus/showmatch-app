// Premade libraries import
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:watchmatchapp/components/buttons.dart';
import 'package:watchmatchapp/helpers/preferences.dart';

// Importing required custom screens and scripts
import 'package:watchmatchapp/screens/interface/home.dart';
import 'package:watchmatchapp/screens/auth_welcome/login.dart';
import 'package:watchmatchapp/screens/auth_welcome/register.dart';
import 'package:watchmatchapp/helpers/helper.dart';

// Importing custom widgets

final emailController = TextEditingController();
final passwordController = TextEditingController();

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.transparent,
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

  Future _login() async {
    // Check if the fields are empty, if so displaying an error
    if ((passwordController.text.isEmpty) || (emailController.text.isEmpty)) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Login info is missing"),
          );
        }
      );
    } else {
      // Mapping the data
      Map < String, String > loginRequest = {
        "login": emailController.text,
        "password": passwordController.text
      };

      // Making the POST request
      callAPI(context, '/user/login/', loginRequest)
        .then((response) {
          // Decoding the JSON response we got from POST request
          Map < String, dynamic > uData = jsonDecode(response.body);

          // Status code handling
          if (response.statusCode == 200) { // Accepted
            // Saving the token into SharedPreferences
            defaultValues(uData['token'], context)
              .then((login) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              })
              .catchError((err) => print(err));

          } else if (response.statusCode == 403) {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Wrong login information"),
                );
              }
            );
          } else { // Other errors
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("An unknown error has occurred. Please contact the sysadmin"),
                );
              }
            );
          }
        })
        .catchError((err) {});
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    );

    // Keyboard visibility check (if == 0.0) keyboard is hidden
    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      setState(() {
        isKeyboardOpen = false;
      });
    } else {
      setState(() {
        isKeyboardOpen = true;
      });
    }

    return Scaffold(
      body: Stack(
        children: < Widget > [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: < Color > [
                  Color.fromRGBO(63, 169, 245, 1.0),
                  Color.fromRGBO(0, 179, 104, 1.0)
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0, vertical: 80.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  new Image.asset('assets/images/placeholder.png', height: 150.0),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "Login"[0],
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 3,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: isKeyboardOpen ? null :
      fabExtended(150.0, "Login", null, Color.fromRGBO(33, 222, 170, 1), _login, Colors.white, "login"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}