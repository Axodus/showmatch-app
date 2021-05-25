import 'package:ShowMatch/helpers/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

defaultValues(String token, context) async{
  SharedPreferences storage = await SharedPreferences.getInstance();

  storage.setString('token', token);

  getUser(context);
}