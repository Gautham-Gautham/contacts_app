import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/SnackBar/snack_bar.dart';
import '../../OtpVerification/Screens/otp_screen.dart';
import '../Provider/login_model.dart';

class LoginProvider extends ChangeNotifier {
  final LoginModel _model = LoginModel();
  String otp = '';
  LoginModel get model => _model;
  bool isLoading = false;
  loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void navigateToOtpScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          number: _model.phoneNumber.text.trim(),
        ),
      ),
    );
  }

  getOtp({required BuildContext context}) async {
    if (model.phoneNumber.text.isNotEmpty &&
        model.phoneNumber.text.length == 10) {
      loading();
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {},
          codeSent: (verificationId, forceResendingToken) {
            navigateToOtpScreen(context);
            otp = verificationId;
          },
          codeAutoRetrievalTimeout: (verificationId) {},
          phoneNumber: "+91${model.phoneNumber.text}");
      // provider.isLoading = false;
    } else {
      showSnackBar(context, "Please Check The Mobile Number");
    }
  }
}
