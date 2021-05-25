import 'dart:convert';
import 'dart:io';

import 'package:ShowMatch/helpers/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future < void > errorMessage(context, [var msg]) async {

  if (msg == null) {
    msg = "Server com failed. Check your internet or contact the sysadmin";
  }

  Widget okButton = FlatButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text("OK")
  );

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(msg),
          actions: [okButton],
        );
      }
    );
  });
}

getRequest(context, apiEndpoint) async {

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, var host, int port) => true);

  var url = "$apiUrl/$apiEndpoint";

  HttpClientRequest request = await client.getUrl(Uri.parse(url));

  request.headers.set('content-type', 'application/json');

  HttpClientResponse response = await request.close();

  var reply = await response.transform(utf8.decoder).join();
  print(reply);

  return reply;
}

getUser(context) async {

  SharedPreferences storage = await SharedPreferences.getInstance();
  var token = storage.getString('token');

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, var host, int port) => true);

  var url = "$apiUrl/user/me";

  HttpClientRequest request = await client.getUrl(Uri.parse(url));

  request.headers.set('content-type', 'application/json');
  request.headers.set('token', token);

  HttpClientResponse response = await request.close();

  var reply = await response.transform(utf8.decoder).join();

  print("USER: ");
  print(reply);

  var user = jsonDecode(reply);

  var name = storage.setString('name', user["username"]);
  var email = storage.setString('email', user["email"]);

  print(name);
  print(email);
}

postRequest(context, String apiEndpoint, Map < String, String > json) async {

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, var host, int port) => true);

  var url = "$apiUrl/$apiEndpoint";

  var sendBody = jsonEncode(json);

  HttpClientRequest request = await client.postUrl(Uri.parse(url));

  request.headers.set('content-type', 'application/json');

  request.add(utf8.encode(sendBody));

  HttpClientResponse response = await request.close();

  var reply = await response.transform(utf8.decoder).join();
  print(reply);

  return reply;
}