import 'package:simple_calculator_app/customWidgets/custom_results_screen.dart';
import 'package:flutter/material.dart';
import '../customWidgets/custom_grid_view.dart';
import 'package:simple_calculator_app/models/calculator_button_model.dart';
import 'package:simple_calculator_app/models/calculator_buttons_list.dart';

import '../services/calculator_logic.dart';

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({super.key});

  @override
  State<CalculatorForm> createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  //display empty resultText or display 0 Number as default
  //String resultText = '0';
  String resultText = '';

  //declare void CallBack Function to print the pressed Buttons and make the conditions Cases
  void onButtonPressed(CalculatorButton button) {
    //change the state to make the resultText Shown on the Screen
    setState(() {
      resultText = CalculatorLogic.handleButtonPress(
        currentText: resultText,
        button: button,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefe7b2),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .085,
        backgroundColor: const Color(0xffefe7b2),
        centerTitle: true,
        title: const Text(
          'SIMPLE CALCULATOR',
          style: TextStyle(
            color: Color(0xff565656),
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomResultsScreen(
            resultText: resultText,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomGridView(
            gridList: calculatorButtons, // Use the model-based list
            onButtonPressed: onButtonPressed, // <-- pass the callback here
          ),
        ],
      ),
    );
  }
}
