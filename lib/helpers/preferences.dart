import 'package:shared_preferences/shared_preferences.dart';

defaultValues(String token, context) async{
  SharedPreferences storage = await SharedPreferences.getInstance();

  storage.setString('token', token);

  storage.setString('fullName', 'Mr. Jonesy');
}

saveData(email) async {
  SharedPreferences storage = await SharedPreferences.getInstance();

  storage.setString('email', email);
}