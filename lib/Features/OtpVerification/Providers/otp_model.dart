import 'dart:async';

import 'package:flutter/cupertino.dart';

class OtpModel extends ChangeNotifier {
  TextEditingController fst = TextEditingController();
  TextEditingController snd = TextEditingController();
  TextEditingController trd = TextEditingController();
  TextEditingController fth = TextEditingController();
  TextEditingController nbrs = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  late Timer timer;

  @override
  void dispose() {
    fst.dispose();
    snd.dispose();
    trd.dispose();
    fth.dispose();
    nbrs.dispose();
    focusNode4.dispose();
    focusNode3.dispose();
    focusNode2.dispose();
    focusNode1.dispose();
    super.dispose();
  }
}
