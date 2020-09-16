import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

defaultValues(String token, context) async{
  final storage = await SharedPreferences.getInstance();

  storage.setString('token', token);
}