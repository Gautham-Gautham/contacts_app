import 'package:flutter/cupertino.dart';

class CreateUserModel extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  void dispose() {
    name.dispose();
    number.dispose();
    super.dispose();
  }
}
