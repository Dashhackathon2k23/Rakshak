import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathonapplication/model/signup_model.dart';

class AuthProvider extends ChangeNotifier {
  SignUpModel? signUpModel;

}
