

import 'calculator_button_model.dart';

const List<CalculatorButton> calculatorButtons = [
  CalculatorButton(label: 'AC', actionType: ButtonActionType.clearAll),
  CalculatorButton(label: 'C', actionType: ButtonActionType.clearEntry),
  CalculatorButton(label: '%', actionType: ButtonActionType.percent),
  CalculatorButton(label: '/', actionType: ButtonActionType.operator),
  CalculatorButton(label: '7', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '8', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '9', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '*', actionType: ButtonActionType.operator),
  CalculatorButton(label: '4', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '5', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '6', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '-', actionType: ButtonActionType.operator),
  CalculatorButton(label: '1', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '2', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '3', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '+', actionType: ButtonActionType.operator),
  CalculatorButton(label: '0', actionType: ButtonActionType.numeric),
  CalculatorButton(label: '+/-', actionType: ButtonActionType.toggleSign),
  CalculatorButton(label: '.', actionType: ButtonActionType.decimal),
  CalculatorButton(label: '=', actionType: ButtonActionType.equals),
  // CalculatorButton(label: 'x\u00B2', actionType: ButtonActionType.operator),
  // CalculatorButton(label: '\u221Ax', actionType: ButtonActionType.operator),
  // CalculatorButton(label: '', actionType: ButtonActionType.operator),
  // CalculatorButton(label: '', actionType: ButtonActionType.operator),
];