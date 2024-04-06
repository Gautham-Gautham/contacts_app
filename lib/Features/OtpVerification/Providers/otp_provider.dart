import 'dart:async';

import 'package:contacts_app/Features/Authentication/Provider/login_provider.dart';
import 'package:flutter/material.dart';

import 'otp_model.dart';

class OtpProvider extends ChangeNotifier {
  final OtpModel otpModel = OtpModel();
  final LoginProvider login = LoginProvider();
  String currentText = '';

  int start = 60;
  bool isLoading = false;

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  OtpProvider() {
    startTimer();
  }
  void startTimer() {
    const oneMinute = Duration(seconds: 1);
    otpModel.timer = Timer.periodic(
      oneMinute,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }
}
