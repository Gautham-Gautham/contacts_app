import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../OtpVerification/Screens/otp_screen.dart';
import '../Provider/login_model.dart';

class LoginProvider extends ChangeNotifier {
  final LoginModel _model = LoginModel();
  String otp = '';
  LoginModel get model => _model;

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

  getOtp() {}
}
