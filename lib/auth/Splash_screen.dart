import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/dimensions.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:hackathonapplication/widgets/button_widgets.dart';
import 'package:hackathonapplication/widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      hasAppbar: false,
      hasBack: false,
      backgroundColor: Palette.mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 170,
          ),
          _heading(),
          const SizedBox(
            height: 70,
          ),
          _signUpButton(),
          h20,
          _loginButton(),
          h30,
          _skip()
        ],
      ),
    );
  }

  Widget _heading() {
    return const Center(
      child: Texts(
        "DISASTER",
        fontSize: 50,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
        color: Palette.white,
      ),
    );
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
      onTap: () {},
      text: 'SIGN UP',
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
      onTap: () {},
      text: 'LOGIN',
    );
  }

  Widget _skip() {
    return FilledButtons(
      height: 35,
      width: 175,
      borderRadius: 15,
      borderWidth: 0.5,
      borderSideColor: Palette.white,
      fontWeight: FontWeight.w500,
      color: Colors.transparent,
      onTap: () {},
      text: 'Skip',
    );
  }
}
