import 'package:flutter/material.dart';

import '../../../Features/Authentication/Screens/login.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;

  const NumPad({
    super.key,
    this.buttonSize = 70,
    this.buttonColor = Colors.black,
    this.iconColor = Colors.amber,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Implement the number keys (from 1 to 9) using the NumberButton widget
            NumberButton(
                number: 1,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 2,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 3,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Implement more NumberButton widgets for other digits
            // Add the delete and submit buttons
            NumberButton(
                number: 4,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 5,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 6,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Implement more NumberButton widgets for other digits
            // Add the delete and submit buttons
            NumberButton(
                number: 7,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 8,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            NumberButton(
                number: 9,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Implement more NumberButton widgets for other digits
            // Add the delete and submit buttons
            // Spacer(),
            SizedBox(
              width: width * 0.25,
              height: height * 0.08,
            ),
            NumberButton(
                number: 0,
                size: buttonSize,
                color: buttonColor,
                controller: controller),
            ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    controller.text = controller.text
                        .substring(0, controller.text.length - 1);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(
                    width * 0.25,
                    height * 0.08,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Icon(Icons.backspace_outlined)),
          ],
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press: update the controller with the selected number
        controller.text += number.toString();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(
          width * 0.25,
          height * 0.08,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(number.toString(),
          style: TextStyle(fontSize: width * 0.08, color: Colors.black)),
    );
  }
}
