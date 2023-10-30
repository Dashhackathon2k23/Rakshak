import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hackathonapplication/app/globals.dart';
import 'package:hackathonapplication/disaster_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


void runAtStartUp() async {
  sharedPref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const DisasterApp());
}
