import 'package:contacts_app/Core/SnackBar/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Core/common/CustomeKeypad&Button/key_pad.dart';
import '../../../Core/custom_textform_field/custom_textform.dart';
import '../../OtpVerification/Screens/new_otp_screen.dart';
import '../Provider/login_provider.dart';

double height = 0;
double width = 0;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  sendOtp(
      {required BuildContext context, required LoginProvider provider}) async {
    if (provider.model.phoneNumber.text.isNotEmpty &&
        provider.model.phoneNumber.text.length == 10) {
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {},
          codeSent: (verificationId, forceResendingToken) {
            provider.navigateToOtpScreen(context);
            provider.otp = verificationId;
          },
          codeAutoRetrievalTimeout: (verificationId) {},
          phoneNumber: "+91${provider.model.phoneNumber.text}");
    } else {
      showSnackBar(context, "Please Check The Mobile Number");
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/logingsvg.svg",
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Phone Number",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.05,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        SizedBox(
                          width: width * 0.85,
                          child: CustomTextField(
                            keyboardType: TextInputType.none,
                            controller: provider.model.phoneNumber,
                            label: 'Enter Phone Number',
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By Continuing, I agree to ',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: width * 0.03,
                                ),
                              ),
                              TextSpan(
                                text: 'TotalX’s ',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: width * 0.03,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms and condition ',
                                style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontSize: width * 0.03,
                                ),
                              ),
                              TextSpan(
                                text: '&\n',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: width * 0.03,
                                ),
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
                  Consumer<LoginProvider>(
                    builder: (context, provider2, child) {
                      return Center(
                        child: provider2.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  print(provider2.isLoading);
                                  // sendOtp(context: context, provider: provider);
                                  if (provider
                                          .model.phoneNumber.text.isNotEmpty &&
                                      provider.model.phoneNumber.text.length ==
                                          10) {
                                    provider2.loading();
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                            verificationCompleted:
                                                (phoneAuthCredential) {},
                                            verificationFailed: (error) {},
                                            codeSent: (verificationId,
                                                forceResendingToken) {
                                              provider
                                                  .navigateToOtpScreen(context);
                                              provider.otp = verificationId;
                                            },
                                            codeAutoRetrievalTimeout:
                                                (verificationId) {},
                                            phoneNumber:
                                                "+91${provider.model.phoneNumber.text}");
                                    // provider.isLoading = false;
                                  } else {
                                    showSnackBar(context,
                                        "Please Check The Mobile Number");
                                  }

                                  // provider.navigateToOtpScreen(context);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => NewOtpScreen(),
                                  //     ));
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  minimumSize: Size(
                                    width * 0.8,
                                    MediaQuery.of(context).size.height * 0.06,
                                  ),
                                ),
                                child: Text(
                                  'Get OTP',
                                  style: GoogleFonts.poppins(
                                    fontSize: width * 0.05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                      );
                    },
                  ),
                  NumPad(
                    buttonColor: Colors.white,
                    controller: provider.model.phoneNumber,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
