import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  TextEditingController phoneNumber = TextEditingController();

  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }
}
