import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.onButtonClick});

  final String buttonText;
  //Define Void CallBack Function to Handel the different cases of ButtonClick
  final VoidCallback onButtonClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: const Color(0xffb2bfef),
        foregroundColor: const Color(0xff565656),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
