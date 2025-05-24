import 'package:simple_calculator_app/models/calculator_button_model.dart';

class CalculatorLogic {
  // Declare This variable and use it across all.
  static const List<String> _operators = ['+', '-', '*', '/'];


  //define a static method without needing to instantiate the class.
  //this method takes two arguments "currentText" & "The Model"
  static String handleButtonPress({
    required String currentText,
    required CalculatorButton button,
  }) {
    /*We're switching over the actionType of the pressed button — which we assume
    comes from an enum ButtonActionType { numeric, operator, clearAll,
    clearEntry, equals, decimal, toggleSign, percent }.*/
    switch (button.actionType) {
      //Case AC
      case ButtonActionType.clearAll:
        return '';
      //Case C
      case ButtonActionType.clearEntry:
        return currentText.isNotEmpty
            ? currentText.substring(0, currentText.length - 1)
            : '';
      case ButtonActionType.numeric:
        return currentText + button.label;
      case ButtonActionType.operator:


        if (currentText.isEmpty) {
          // Allow minus sign as first character
          return button.label == '-' ? '-' : currentText;
        }

        final lastChar = currentText[currentText.length - 1];

        if (_operators.contains(lastChar)) {
          // Replace last operator with new one
          return currentText.substring(0, currentText.length - 1) +
              button.label;
        }
        return currentText + button.label;
      //Case Decimal '.'
      case ButtonActionType.decimal:
        // If currentText is empty, start with "0."
        if (currentText.isEmpty) {
          return '0.';
        }
        // Prevent multiple decimals in the current number
        final lastNumber = _getLastNumber(currentText);
        if (lastNumber.contains('.')) {
          return currentText; // No change
        }
        return currentText + button.label;

      /*This code is for a +/- button that toggles between
      positive and negative numbers.
       */
      case ButtonActionType.toggleSign:
        if (currentText.startsWith('-')) {
          /* If number is already negative, make it positive
          by removing the negative sign.
           */
          return currentText.substring(1);
        } else if (currentText.isNotEmpty) {
          // If number is positive, make it negative
          return '-$currentText';
        }
        return currentText;
      case ButtonActionType.percent:
        // Take the right subString of the operator.
        final lastNumber = _getLastNumber(currentText);
        // prevent multiple %
        if (lastNumber.contains('%')) return currentText;
        return '$currentText%';
      case ButtonActionType.equals:
        /*The entire calculation is wrapped in a try-catch block to handle
        any parsing or calculation errors gracefully.
         */
        try {
          /*Will store the position of the first operator found
          (-1 means no operator found)
           */
          int opIndex = -1;
          //Will store the actual operator character ('+', '-', '*', '/')
          String? selectedOp;

          /* Find first operator in the expression (skip index 0 for leading
          minus). Avoiding treating a leading minus sign as an operator
           */
          for (int i = 1; i < currentText.length - 1; i++) {
            if (_operators.contains(currentText[i])) {
              opIndex = i;
              selectedOp = currentText[i];
              break;
            }
          }

          if (opIndex > 0 && selectedOp != null) {
            final part1 = currentText.substring(0, opIndex).trim();
            final part2 = currentText.substring(opIndex + 1).trim();
            final n1 = _parseWithPercent(part1);
            final n2 = _parseWithPercent(part2);

            switch (selectedOp) {
              case '+':
                return (n1 + n2).toString();
              case '-':
                return (n1 - n2).toString();
              case '*':
                return (n1 * n2).toString();
              case '/':
                if (n2 == 0) return 'Error';
                return (n1 / n2).toString();
            }
          }
          /*
          The else block executes when the condition if (opIndex > 0
          && selectedOp != null) is false, which happens in these scenarios:
          No operator found at all (opIndex remains -1) Operator found at
          index 0 (opIndex = 0, but condition requires > 0) selectedOp is null
           (shouldn't happen if opIndex > 0, but safety check)
           */
          else {
            /*
            No operator, just parse single number or percent and Takes the
            entire currentText as input and Calls _parseWithPercent() to handle
            both regular numbers and percentages and Returns a double value and
            finally convert it to String.
            */
            final result = _parseWithPercent(currentText);
            return result.toString();
          }
        } catch (e) {
          return 'Error';
        }
        return currentText;
    }
  }

  /*The function’s job is to extract the last number in a mathematical
  expression string. This is important when you want to, for example,
  check if that last number already contains a decimal point before adding
  another decimal.*/
  /*Examples: Input: "123+456"
              Loops backward: 6, 5, 4, + ← finds operator at index 3
              Returns: input.substring(3 + 1) = input.substring(4) = "456"
              Input: "10*25-7"
              Loops backward: 7, - ← finds operator at index 5
              Returns: input.substring(5 + 1) = input.substring(6) = "7"
              Input: "999"
              Loops through entire string, no operator found
              Returns: "999" (the whole string)
              Purpose: This function extracts the last/rightmost number
              from a mathematical expression, which is useful for calculator
              operations like formatting, validation, or continuing calculations.
              So yes - it finds the rightmost operator and gets the substring
              to the right of it!
   */

  // Make this static so it can be called inside static methods
  static String _getLastNumber(String input) {

    // Start from the end of the string and go backwards until it reaches to
    //operator and then get the wright number.
    for (var i = input.length - 1; i >= 0; i--) {
      if (_operators.contains(input[i])) {
        // Found an operator! Return everything AFTER it
        return input.substring(i + 1);
      }
    }
    // No operator found, return the whole string
    return input;
  }

  // Use this method to handel the percent modifier '%'.
  static double _parseWithPercent(String input) {
    // Remove whitespace
    input = input.trim();
    if (input.endsWith('%')) {
      final number = input.substring(0, input.length - 1); // Remove '%'
      /*Validates the number before parsing & Converts percentage to decimal
      (50% → 0.5) and return 0 For regular numbers.
       */
      return double.tryParse(number) != null ? double.parse(number) / 100 : 0;
    }
    return double.tryParse(input) ?? 0; // Parse as regular number
  }
}
