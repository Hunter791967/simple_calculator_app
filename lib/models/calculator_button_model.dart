
enum ButtonActionType {
  numeric,
  operator,
  clearEntry,     // for 'C'
  clearAll,       // for 'AC'
  toggleSign,
  percent,
  decimal,
  equals,
}

class CalculatorButton {
  final String label;
  final ButtonActionType actionType;

  const CalculatorButton({
    required this.label,
    required this.actionType,
  });
}