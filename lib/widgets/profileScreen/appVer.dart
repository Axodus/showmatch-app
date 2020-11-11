import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

String appVersion = "";

appVer(BuildContext context) {
  return StatefulBuilder(builder: (context, setState) {

    PackageInfo.fromPlatform().then((packageInfo){
      setState(() {
        appVersion = packageInfo.version;
      });
    });

    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "App Version: $appVersion",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  });
}