
import 'package:flutter/material.dart';
import 'package:simple_calculator_app/views/calculator_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMPLE CALCULATOR',
      debugShowCheckedModeBanner: false, // removes the DEBUG label
      routes: {
        'homePage': (context) => const CalculatorForm(),
      },
      initialRoute: 'homePage',
    );
  }
}
