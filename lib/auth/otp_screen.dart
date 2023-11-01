import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/auth/mobile_number_screen.dart';
import 'package:hackathonapplication/auth/signup_screen.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return BaseScaffold(
      hasAppbar: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.mainColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "  Mobile Number Verification",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Palette.white),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "We need to register your phone before getting started!",
              style: TextStyle(fontSize: 16,  color: Palette.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Pinput(
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onChanged: (value) {
              setState(() {
                otp = value;
              });
            },
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff09A789),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    PhoneAuthCredential credential =
                    PhoneAuthProvider.credential(
                        verificationId: mobileNumberScreen.verifications, smsCode: otp);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUPScreen();
                      },
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Wrong otp",
                        style: TextStyle(fontSize: 15),
                      ),
                      backgroundColor: Colors.white,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 450, right: 100, left: 100),
                      elevation: 50,
                      showCloseIcon: true,
                      duration: Duration(seconds: 2),
                      animation: Animation.fromValueListenable(CurvedAnimation(
                          parent: kAlwaysCompleteAnimation,
                          curve: Curves.easeInOutCubicEmphasized)),
                    )

                    );
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
          )
        ]),
      ),
    );
  }
}
