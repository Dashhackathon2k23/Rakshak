import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapplication/app/Palette.dart';
import 'package:hackathonapplication/app/globals.dart';
import 'package:hackathonapplication/auth/otp_screen.dart';
import 'package:hackathonapplication/widgets/base_scaffold.dart';
import 'package:hackathonapplication/widgets/button_widgets.dart';
import 'package:hackathonapplication/widgets/text_field_widget.dart';

class mobileNumberScreen extends StatefulWidget {
  const mobileNumberScreen({Key? key}) : super(key: key);
  static String verifications = "";

  @override
  State<mobileNumberScreen> createState() => _mobileNumberScreenState();
}

class _mobileNumberScreenState extends State<mobileNumberScreen> {
  final tcPhone = TextEditingController();

  String vid = "";
  String countrycode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height;
    double keboardheight = MediaQuery.of(context).viewInsets.bottom;
    double height = heightt - keboardheight;

    return BaseScaffold(
      hasAppbar: false,
      hasBack: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.mainColor,
      child: Container(
         margin: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            " Mobile Number Verification",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Palette.white),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              "We need to register your phone before getting started!",
              style: TextStyle(fontSize: 16, color: Palette.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
         _numberTextField(),

          const SizedBox(
            height: 40,
          ),
          _sendOtp(),
        ]),
      ),
    );
  }
  Widget _numberTextField() {
    return SizedBox(
      width: screenWidth,
      child: TextFormFieldWidget(
        controller: tcPhone,
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


  Widget _sendOtp() {
    return FilledButtons(
      color: const Color(0xff09A789),
      fontSize: 18,
      applyGradient: true,
      textColor: Palette.white,
      fontWeight: FontWeight.bold,
      height: 55,
      width: screenWidth,
      onTap: () async {
        // await FirebaseAuth.instance.verifyPhoneNumber(
        //   phoneNumber: "+91${tcPhone.text}",
        //   verificationCompleted: (PhoneAuthCredential credential) {},
        //   verificationFailed: (FirebaseAuthException e) {},
        //   codeSent: (String verificationId, int? resendToken) {
        //     setState(() {
        //       mobileNumberScreen.verifications = verificationId;
        //     });
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const otp();
              },
            ));
        //   },
        //   codeAutoRetrievalTimeout: (String verificationId) {},
        // );
      },
      text: 'Send Otp',
    );
  }
}
