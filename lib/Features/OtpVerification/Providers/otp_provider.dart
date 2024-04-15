import 'dart:async';

import 'package:contacts_app/Features/Authentication/Provider/login_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/SnackBar/snack_bar.dart';
import '../../HomeScreen/Screens/home_screen.dart';
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

  otpValidate(
      {required String otp,
      required BuildContext context,
      required void Function() success}) async {
    try {
      loading();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otp, smsCode: currentText.toString());
      print(currentText.toString());
      print(otp);
      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) {
          if (value.user == null) {
            throw 'invalid OTP';
          }
          success();
          print(value.user!.phoneNumber);
          print(value.user!.uid);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
