import 'dart:async';

import 'package:contacts_app/Core/SnackBar/snack_bar.dart';
import 'package:contacts_app/Core/common/CustomeKeypad&Button/key_pad.dart';
import 'package:contacts_app/Core/custom_textform_field/custom_textform.dart';
import 'package:contacts_app/Features/Authentication/Screens/login.dart';
import 'package:contacts_app/Features/OtpVerification/Providers/otp_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../Authentication/Provider/login_provider.dart';
import '../../HomeScreen/Screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OtpProvider model = OtpProvider();

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }
  //
  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: height,
              width: width,
              child: Consumer<OtpProvider>(
                builder: (context, value, child) {
                  final provider = Provider.of<LoginProvider>(context);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/otp.json", height: height * 0.2)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Text(
                              "OTP Verification",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.05),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Enter the verification code we just sent to your \n',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: width * 0.03),
                                  ),
                                  TextSpan(
                                    text: 'number ',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: width * 0.03),
                                  ),
                                  TextSpan(
                                    text:
                                        '+91 ********${widget.number.substring(7)} ',
                                    style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontSize: width * 0.03),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // Container(
                            //     height: height * 0.07,
                            //     width: width,
                            //     // color: Colors.white,
                            //     child: Pinput(
                            //       length: 6,
                            //       controller: value.otpModel.fth,
                            //     )),
                            Container(
                              height: height * 0.07,
                              width: width,
                              // color: Colors.white,
                              child: PinCodeTextField(
                                autoDisposeControllers: false,
                                keyboardType: TextInputType.number,
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    inactiveColor: Colors.black,
                                    inactiveFillColor: Colors.white,
                                    activeFillColor: Colors.white,
                                    disabledColor: Colors.white),
                                animationDuration: Duration(milliseconds: 250),
                                backgroundColor: Colors.white,
                                enableActiveFill: true,
                                controller: value.otpModel.fth,
                                onCompleted: (v) {
                                  print(v);
                                  value.currentText = v;
                                },
                                appContext: context,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Center(
                              child: Text(
                                '0:${value.start}',
                                style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Don\'t Get OTP?',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: width * 0.03),
                              ),
                              TextSpan(
                                text: 'Resend ',
                                style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: width * 0.03),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Consumer<OtpProvider>(
                        builder: (context, otpProvider, child) {
                          return Center(
                            child: otpProvider.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : ElevatedButton(
                                    onPressed: () async {
                                      print(
                                          '---------${value.otpModel.fth.text.toString()}');
                                      print(
                                          "-------------${value.currentText.toString()}");
                                      // navigat();
                                      // try {
                                      //   otpProvider.loading();
                                      //   PhoneAuthCredential credential =
                                      //       PhoneAuthProvider.credential(
                                      //           verificationId: provider.otp,
                                      //           smsCode: value.currentText
                                      //               .toString());
                                      //   print(value.currentText.toString());
                                      //   print(provider.otp);
                                      //   await FirebaseAuth.instance
                                      //       .signInWithCredential(credential)
                                      //       .then(
                                      //     (value) {
                                      //       if (value.user == null) {
                                      //         throw 'invalid OTP';
                                      //       }
                                      //       Navigator.pushAndRemoveUntil(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               HomeScreen(),
                                      //         ),
                                      //         (route) => false,
                                      //       );
                                      //       print(value.user!.phoneNumber);
                                      //       print(value.user!.uid);
                                      //     },
                                      //   );
                                      // } catch (e) {
                                      //   showSnackBar(context, e.toString());
                                      // }
                                      value.otpValidate(
                                          otp: provider.otp,
                                          context: context,
                                          success: () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                              (route) => false,
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        minimumSize:
                                            Size(width * 0.8, height * 0.06)),
                                    child: Text(
                                      'Verify OTP',
                                      style: GoogleFonts.poppins(
                                          fontSize: width * 0.05,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    )),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
