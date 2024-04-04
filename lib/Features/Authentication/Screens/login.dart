import 'package:contacts_app/Core/common/CustomeKeypad&Button/Button_common.dart';
import 'package:contacts_app/Core/custom_textform_field/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/common/CustomeKeypad&Button/key_pad.dart';

double height = 0;
double width = 0;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  @override
  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/logingsvg.svg"),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Phone Number",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: width * 0.05),
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      width: width * 0.85,
                      child: CustomTextField(
                          controller: phoneNumber, label: 'Enter Phone Number'),
                    ),
                    SizedBox(height: height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By Continuing, I agree to ',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: width * 0.03),
                          ),
                          TextSpan(
                            text: 'TotalX’s ',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: width * 0.03),
                          ),
                          TextSpan(
                            text: 'Terms and condition ',
                            style: GoogleFonts.poppins(
                                color: Colors.blue, fontSize: width * 0.03),
                          ),
                          TextSpan(
                            text: '&\n',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: width * 0.03),
                          ),
                          TextSpan(
                            text: 'privacy policy',
                            style: GoogleFonts.poppins(
                              fontSize: width * 0.03,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const CommonButton(buttonName: "Get OTP"),
              NumPad(
                buttonColor: Colors.white,
                controller: phoneNumber,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Usage example:
// NumPad(controller: myController, delete: deleteFunction, onSubmit: submitFunction)
