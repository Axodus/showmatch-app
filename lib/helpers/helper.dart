import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:watchmatchapp/screens/auth_welcome/login.dart';

Future <void> errorMessage (context, [String msg]) async {

  if(msg == null) {
    msg = "Server com failed. Check your internet or contact the sysadmin";
  }

  Widget confirmButton = FlatButton(
    onPressed: () { Navigator.of(context).pop(); },
    child: Text("OK")
  );

  WidgetsBinding.instance.addPostFrameCallback((_) async{
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(msg),
          actions: [confirmButton],
        );
      }
    );
  });
}

Future <Response> callAPI (context, endpoint, [ Map <String, dynamic> request] ) async {
  try {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('token');

    var head = {
      "Authorization": "Bearer $token"
    };

    var response = await post(GlobalConfiguration().getString('API_ACCESS') + endpoint, headers: head, body: request);
    
    if(response.statusCode == 403) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }

    return response;
    
  } catch(e) {
    errorMessage(context);
    return Future.error(e);
  }
}