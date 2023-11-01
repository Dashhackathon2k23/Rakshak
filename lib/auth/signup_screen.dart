import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/app/dimensions.dart';
import 'package:hackathonapplication/auth/Splash_screen.dart';
import 'package:hackathonapplication/model/signup_model.dart';
import 'package:hackathonapplication/provider/authprovider.dart';
import 'package:hackathonapplication/screen/HomeScreenMap.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:hackathonapplication/widgets/button_widgets.dart';
import 'package:hackathonapplication/widgets/text_field_widget.dart';
import 'package:hackathonapplication/widgets/text_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  static String token = "";

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final tcNumber = TextEditingController();
  final tcName = TextEditingController();
  final pinController = TextEditingController();
  final cPinController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String mpinValue = "";
  String cMpinValue = "";
  SignUpModel? model;
  late AuthProvider authProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authProvider = context.read<AuthProvider>();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = context.watch<AuthProvider>();
    return BaseScaffold(
        hasBack: true,
        hasAppbar: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.mainColor,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              _signUpText(),
              SizedBox(
                height: 50,
              ),
              _nameTextField(),
              h20,
              _numberTextField(),
              h30,
              _mPinText(),
              h10,
              _mPin(),
              h30,
              _confirmMpinText(),
              h10,
              _confirmMPin(),
              SizedBox(
                height: 50,
              ),
              _signUpButton(),
            ],
          ),
        ));
  }

  Widget _signUpButton() {
    return FilledButtons(
      color: const Color(0xff09A789),
      fontSize: 18,
      applyGradient: true,
      textColor: Palette.white,
      fontWeight: FontWeight.bold,
      height: 55,
      width: 271,
      onTap: () {
        // authProvider
        //     .signupApi(
        //     name: tcName.text,
        //     MPIN: mpinValue,
        //     cMPIN: cMpinValue,
        //     number: tcNumber.text)
        //     .then((value) {
        //   SignUPScreen.token = authProvider.signUpModel!.data!.token!;
        //   SplashScreen.pref!.setString("token", SignUPScreen.token);
        //   SplashScreen.pref!.setBool("loginOrSignup", true);
        //
        //   setState(() {});
        //   if (authProvider.signUpModel!.success == "Success") {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //       builder: (context) {
        //         return HomeScreen();
        //       },
        //     ));
        //   }
        // });
        _signUpApi();
      },
      text: 'SIGN UP',
    );
  }

  Widget _signUpText() {
    return const Center(
      child: Texts(
        "SIGN UP",
        fontSize: 50,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
        color: Palette.white,
      ),
    );
  }

  Widget _numberTextField() {
    return SizedBox(
      width: 330,
      child: TextFormFieldWidget(
        controller: tcNumber,
        filled: true,
        textAlign: TextAlign.center,
        filledColor: Colors.white38,
        textInputType: TextInputType.number,
        hintText: "Enter Your Number",
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 17),
        style: const TextStyle(color: Colors.black45, fontSize: 20),
        maxLength: 10,
        validator: (value) {
          if (value!.isEmpty) {
            return "enter a phone number";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _nameTextField() {
    return SizedBox(
      width: 330,
      child: TextFormFieldWidget(
        controller: tcName,
        filled: true,
        textAlign: TextAlign.center,
        filledColor: Colors.white38,
        textInputType: TextInputType.text,
        hintText: "Enter Your name",
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 17),
        style: const TextStyle(color: Colors.black45, fontSize: 20),
        maxLength: 10,
        validator: (value) {
          if (value!.isEmpty) {
            return "enter your  name";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _mPin() {
    return Pinput(
      length: 4,
      forceErrorState: true,
      controller: pinController,
      validator: (value) {
        if (value!.isEmpty) {
          return "enter a MPin";
        } else {
          return null;
        }
      },
      onCompleted: (value) {
        setState(() {
          mpinValue = value;
        });
      },
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.black45, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Palette.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _confirmMPin() {
    return Pinput(
      length: 4,
      forceErrorState: true,
      controller: cPinController,
      validator: (value) {
        if (value!.isEmpty) {
          return "enter a MPin";
        } else {
          return null;
        }
      },
      onCompleted: (value) {
        setState(() {
          cMpinValue = value;
        });
      },
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.black45, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Palette.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _mPinText() {
    return const Center(
      child: Texts(
        "MPIN",
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Palette.white,
      ),
    );
  }

  Widget _confirmMpinText() {
    return const Center(
      child: Texts(
        " Confirm MPIN",
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Palette.white,
      ),
    );
  }

  Future<void> _signUpApi() async {
    var map = {
      "name": tcName.text,
      "MPIN": mpinValue.toString(),
      "MPINConfirm": cMpinValue.toString(),
      "number": "+91${tcNumber.text}",
    };
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.parse("https://rakshak-dev.onrender.com/api/v1/users/signUp");
    var response = await http.post(url, body: jsonEncode(map), headers: header);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void getprefrences() {
    setState(() {
      SignUPScreen.token = SplashScreen.pref!.getString("token") ?? "";
    });
  }
}
