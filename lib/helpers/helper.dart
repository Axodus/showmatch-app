import 'dart:convert';
import 'dart:io';

import 'package:ShowMatch/helpers/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future < void > errorMessage(context, [String msg]) async {

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

getRequest(context, String apiEndpoint) async {

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  String url = "$apiUrl/$apiEndpoint";

  HttpClientRequest request = await client.getUrl(Uri.parse(url));

  request.headers.set('content-type', 'application/json');

  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();
  print(reply);

  return reply;
}

postRequest(context, String apiEndpoint, Map < String, String > json) async {

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  String url = "$apiUrl/$apiEndpoint";

  String sendBody = jsonEncode(json);

  HttpClientRequest request = await client.postUrl(Uri.parse(url));

  request.headers.set('content-type', 'application/json');

  request.add(utf8.encode(sendBody));

  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();
  print(reply);

  return reply;
}