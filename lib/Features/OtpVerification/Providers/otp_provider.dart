import 'dart:async';

import 'package:flutter/material.dart';

import 'otp_model.dart';

class OtpProvider extends ChangeNotifier {
  final OtpModel otpModel = OtpModel();
  String currentText = '';

  int start = 60;

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
