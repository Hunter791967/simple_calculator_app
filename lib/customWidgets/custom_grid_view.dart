import 'package:simple_calculator_app/customWidgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator_app/models/calculator_button_model.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key,
    required this.gridList,
    required this.onButtonPressed});

  // Define your buttons (20 in total, for 4x5 layout)
  final List<CalculatorButton> gridList;
  // Define Function to handle the Button Pressed.
  final Function(CalculatorButton button) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 08, vertical: 08),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .65,
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 24,
        crossAxisSpacing: 8,
        children: gridList.map((buttonText) {
          return CustomElevatedButton(
            buttonText: buttonText.label,
            onButtonClick: () => onButtonPressed(buttonText)
          );
        }).toList(),
      ),
    );
  }
}
