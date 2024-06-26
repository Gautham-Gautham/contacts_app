import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Features/Authentication/Screens/login.dart';

class CommonButton extends StatelessWidget {
  final String buttonName;
  final Function ontap;
  const CommonButton(
      {super.key, required this.buttonName, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => ontap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(width * 0.8, height * 0.06)),
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
                fontSize: width * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )),
    );
  }
}
