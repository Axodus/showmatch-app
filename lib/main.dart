import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ShowMatch/screens/auth_welcome/welcome.dart';
import 'package:ShowMatch/screens/interface/home.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration().loadFromAsset("app_settings");

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    )
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
    .then((_) => runApp(
     new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome()
      )
    ));
}