import 'package:flutter/material.dart';

class CustomResultsScreen extends StatelessWidget {
  const CustomResultsScreen({super.key, required this.resultText});

  //Define the resultText to print it on screen
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 08, vertical: 08),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .14,
      decoration: BoxDecoration(
        color: const Color(0xffb2bfef),
        borderRadius: BorderRadius.circular(12), // rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(2, 4), // shadow direction
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
          child: Text(
            resultText, // To be passed in
            style: const TextStyle(
                color: Color(0xff565656),
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
