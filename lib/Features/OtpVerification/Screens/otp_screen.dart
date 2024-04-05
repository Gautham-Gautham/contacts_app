import 'dart:async';

import 'package:contacts_app/Core/common/CustomeKeypad&Button/key_pad.dart';
import 'package:contacts_app/Core/custom_textform_field/custom_textform.dart';
import 'package:contacts_app/Features/Authentication/Screens/login.dart';
import 'package:contacts_app/Features/OtpVerification/Providers/otp_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

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
                          SvgPicture.asset(
                            "assets/otp.svg",
                            height: height * 0.2,
                          ),
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
                                  print("Completed");
                                },
                                onChanged: (value1) {
                                  print(value1);

                                  value.currentText = value1;
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
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
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              // navigat();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(width * 0.8, height * 0.06)),
                            child: Text(
                              'Verify OTP',
                              style: GoogleFonts.poppins(
                                  fontSize: width * 0.05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                      ),

                      // FlutterOtpField(
                      //   inputFieldLength: 4,
                      //   spaceBetweenFields: 10,
                      //   onValueChange: (String value) {
                      //     print("otp changed $value");
                      //   },
                      //   onCompleted: (String value) {
                      //     print("otp  $value");
                      //   },
                      // ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     SizedBox(
                      //       width: width * 0.15,
                      //       height: height * 0.07,
                      //       // color: Colors.red,
                      //       // decoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(10),
                      //       //   color: Colors.red,
                      //       // ),
                      //       child: CustomTextField(
                      //           focusNode: focusNode1,
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               // Move focus to the next text field when one digit is entered
                      //               FocusScope.of(context).requestFocus(focusNode2);
                      //             }
                      //           },
                      //           keyboardType: TextInputType.none,
                      //           controller: fst,
                      //           label: ''),
                      //     ),
                      //     SizedBox(
                      //       width: width * 0.15,
                      //       height: height * 0.07,
                      //       // color: Colors.red,
                      //       // decoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(10),
                      //       //   color: Colors.red,
                      //       // ),
                      //       child: CustomTextField(
                      //           keyboardType: TextInputType.none,
                      //           controller: snd,
                      //           label: ''),
                      //     ),
                      //     SizedBox(
                      //       width: width * 0.15,
                      //       height: height * 0.07,
                      //       // color: Colors.red,
                      //       // decoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(10),
                      //       //   color: Colors.red,
                      //       // ),
                      //       child: CustomTextField(
                      //           keyboardType: TextInputType.none,
                      //           controller: trd,
                      //           label: ''),
                      //     ),
                      //     SizedBox(
                      //       width: width * 0.15,
                      //       height: height * 0.07,
                      //       // color: Colors.red,
                      //       // decoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(10),
                      //       //   color: Colors.red,
                      //       // ),
                      //       child: CustomTextField(
                      //           keyboardType: TextInputType.none,
                      //           controller: fth,
                      //           label: ''),
                      //     ),
                      //   ],
                      // ),
                      //
                      // NumPad(
                      //   buttonColor: Colors.white,
                      //   controller: nbrs,
                      // )
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
