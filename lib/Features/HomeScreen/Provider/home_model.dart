import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  TextEditingController search = TextEditingController();

  void dispose() {
    search.dispose();
    super.dispose();
  }
}
