import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/app/dimensions.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:hackathonapplication/widgets/button_widgets.dart';
import 'package:hackathonapplication/widgets/text_field_widget.dart';
import 'package:hackathonapplication/widgets/text_widget.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final tcNumber = TextEditingController();
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      hasBack: false,
      hasAppbar: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.mainColor,
      child: Padding(
        padding: p20,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 130,
              ),
              _loginText(),
              const SizedBox(
                height: 70,
              ),
              _numberText(),
              h20,
              _numberTextField(),
              h30,
              _mPinText(),
              h20,
              _mPin(),
              h50,
              _loginButton(),
              const SizedBox(
                height: 90,
              ),
              _resetPin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Center(
      child: Texts(
        "LOGIN",
        fontSize: 50,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
        color: Palette.white,
      ),
    );
  }

  Widget _numberText() {
    return const Center(
      child: Texts(
        "NUMBER",
        fontWeight: FontWeight.w700,
        fontSize: 20,
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
        validator: (value) {},
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

  Widget _mPin() {
    return Pinput(
      length: 4,
      forceErrorState: true,
      controller: pinController,
      onCompleted: (value) {},
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

  Widget _loginButton() {
    return FilledButtons(
      color: const Color(0xff09A789),
      fontSize: 18,
      applyGradient: true,
      textColor: Palette.white,
      fontWeight: FontWeight.bold,
      height: 55,
      width: 271,
      onTap: () {
        if (formKey.currentState!.validate()) {}
      },
      text: 'LOGIN',
    );
  }

  Widget _resetPin() {
    return const Texts(
      "Reset MPIN",
      fontWeight: FontWeight.w300,
      fontSize: 19,
      textAlign: TextAlign.center,
      textDecoration: TextDecoration.underline,
      color: Palette.white,
    );
  }
}
