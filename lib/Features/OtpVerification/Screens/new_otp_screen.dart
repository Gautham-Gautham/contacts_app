import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../Authentication/Screens/login.dart';

class NewOtpScreen extends StatefulWidget {
  const NewOtpScreen({super.key});

  @override
  State<NewOtpScreen> createState() => _NewOtpScreenState();
}

class _NewOtpScreenState extends State<NewOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.07,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(
          //       "assets/otp.svg",
          //       height: height * 0.2,
          //     ),
          //   ],
          // ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "OTP Verification",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: width * 0.05),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // RichText(
                //   text: TextSpan(
                //     children: <TextSpan>[
                //       TextSpan(
                //         text:
                //         'Enter the verification code we just sent to your \n',
                //         style: GoogleFonts.poppins(
                //             color: Colors.black,
                //             fontSize: width * 0.03),
                //       ),
                //       TextSpan(
                //         text: 'number ',
                //         style: GoogleFonts.poppins(
                //             color: Colors.black,
                //             fontSize: width * 0.03),
                //       ),
                //       // TextSpan(
                //       //   text:
                //       //   '+91 ********${widget.number.substring(7)} ',
                //       //   style: GoogleFonts.poppins(
                //       //       color: Colors.blue,
                //       //       fontSize: width * 0.03),
                //       // ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                    height: height * 0.07,
                    width: width,
                    // color: Colors.white,
                    child: Pinput(
                      length: 6,
                      // controller: otp,
                    )
                    // PinCodeTextField(
                    //   autoDisposeControllers: false,
                    //   keyboardType: TextInputType.number,
                    //   length: 6,
                    //   obscureText: false,
                    //   animationType: AnimationType.fade,
                    //   pinTheme: PinTheme(
                    //       shape: PinCodeFieldShape.box,
                    //       borderRadius: BorderRadius.circular(5),
                    //       fieldHeight: 50,
                    //       fieldWidth: 40,
                    //       inactiveColor: Colors.black,
                    //       inactiveFillColor: Colors.white,
                    //       activeFillColor: Colors.white,
                    //       disabledColor: Colors.white),
                    //   animationDuration: Duration(milliseconds: 250),
                    //   backgroundColor: Colors.white,
                    //   enableActiveFill: true,
                    //   controller: value.otpModel.fth,
                    //   onCompleted: (v) {
                    //     print(v);
                    //     value.currentText = v;
                    //   },
                    //   appContext: context,
                    // ),
                    ),
                SizedBox(
                  height: height * 0.01,
                ),
                Center(
                  child: Text(
                    '0:',
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
          // Center(
          //   child: RichText(
          //     text: TextSpan(
          //       children: <TextSpan>[
          //         TextSpan(
          //           text: 'Don\'t Get OTP?',
          //           style: GoogleFonts.poppins(
          //               color: Colors.black, fontSize: width * 0.03),
          //         ),
          //         TextSpan(
          //           text: 'Resend ',
          //           style: GoogleFonts.poppins(
          //               decoration: TextDecoration.underline,
          //               color: Colors.blue,
          //               fontSize: width * 0.03),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  // navigat();
                  // PhoneAuthCredential credential =
                  // await PhoneAuthProvider.credential(
                  //     verificationId: provider.otp,
                  //     smsCode: value.currentText.toString());
                  // FirebaseAuth.instance
                  //     .signInWithCredential(credential)
                  //     .then(
                  //       (value) {
                  //     Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => HomeScreen(),
                  //       ),
                  //           (route) => false,
                  //     );
                  //     print(value.user!.phoneNumber);
                  //     print(value.user!.uid);
                  //   },
                  // );
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
        ],
      ),
    ));
  }
}
