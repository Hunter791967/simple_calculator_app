Simple Calculator App
A clean and intuitive calculator application built with Flutter, 
featuring a modern UI design and comprehensive mathematical operations.

Application Overview
The Simple Calculator App is a mobile application that provides essential 
arithmetic functionality with an elegant user interface. The app follows 
Flutter best practices with a well-structured architecture separating UI 
components, business logic, and data models.

Key Sections Included:
Application Overview - What the app does and its main features
UI Architecture - Visual design, component structure, and layout details
Logic Architecture - How the business logic works, including the flow and 
supported operations
Data Model Architecture - The CalculatorButton model and ButtonActionType 
enum structure
Technical Implementation - Architecture principles, state management, and 
performance considerations

Key Features

✅ Basic arithmetic operations (Addition, Subtraction, Multiplication, Division)
✅ Decimal number support
✅ Percentage calculations
✅ Sign toggle (positive/negative)
✅ Clear all (AC) and clear entry (C) functions
✅ Error handling for invalid operations
✅ Responsive grid-based button layout
✅ Clean, modern UI with custom color scheme

User Interface (UI) Architecture

Color Scheme: Warm beige background (#efe7b2) with contrasting dark gray text (#565656)
Typography: Bold, clear fonts with emphasis on readability
Layout: Single-screen design with results display and button grid

UI Components Structure
CalculatorForm (Main Screen)
├── AppBar
│   └── Title: "SIMPLE CALCULATOR"
├── CustomResultsScreen
│   └── Display Area for calculations and results
└── CustomGridView
└── 4x5 Grid of calculator buttons
Screen Layout

Header: Application title in the app bar
Results Display: Shows current input and calculation results
Button Grid: 4-column grid containing all calculator buttons
Responsive Design: Adapts to different screen sizes using MediaQuery

Logic Architecture
Core Components

CalculatorForm (StatefulWidget)

Purpose: Main UI container and state management
State Management: Uses setState() to update the display
Key Features:

Manages resultText state variable
Handles button press callbacks
Orchestrates communication between UI and logic



CalculatorLogic (Static Class)

Purpose: Contains all business logic for calculations
Design Pattern: Static methods for stateless operations
Key Methods:

handleButtonPress(): Main entry point for all button interactions
_getLastNumber(): Extracts the rightmost number from expressions
_parseWithPercent(): Handles percentage calculations



Logic Flow
User Button Press → CalculatorForm.onButtonPressed()
→ CalculatorLogic.handleButtonPress()
→ State Update → UI Refresh
Supported Operations
Operation TypeExamplesBehaviorNumeric Input0-9Appends digits to current expressionBasic Arithmetic+, -, *, /Performs calculations between two numbersDecimal.Adds decimal point (prevents duplicates)Percentage%Converts number to percentage (÷100)Sign Toggle+/-Toggles between positive and negativeClear AllACResets entire calculatorClear EntryCRemoves last characterEquals=Executes calculation and shows result
Error Handling

Division by Zero: Returns "Error" message
Invalid Input: Gracefully handles parsing errors
Malformed Expressions: Protected by try-catch blocks

Data Model Architecture
CalculatorButton Model
The application uses a structured data model to represent calculator buttons:
dartclass CalculatorButton {
final String label;           // Display text on button
final ButtonActionType actionType;  // Defines button behavior
}
ButtonActionType Enumeration
dartenum ButtonActionType {
numeric,      // Numbers 0-9
operator,     // +, -, *, /
clearAll,     // AC button
clearEntry,   // C button
equals,       // = button
decimal,      // . button
toggleSign,   // +/- button
percent       // % button
}
Data Flow Architecture
calculatorButtons (List<CalculatorButton>)
↓
CustomGridView receives button list
↓
User interaction triggers callback
↓
CalculatorLogic processes button action
↓
Result returned to UI state
Button Configuration
The calculator uses a centralized button configuration system where each button is defined with:

Label: Visual representation on the UI
Action Type: Determines the logical behavior
Callback Integration: Seamless integration with the logic layer

Technical Implementation Details
State Management

Pattern: StatefulWidget with setState()
Scope: Local state management within CalculatorForm
Data Flow: Unidirectional data flow from UI to logic layer

Architecture Principles

Separation of Concerns: Clear separation between UI, logic, and data
Single Responsibility: Each class has a focused responsibility
Static Methods: Business logic implemented as static methods for efficiency
Error Resilience: Comprehensive error handling throughout the application

Performance Considerations

Efficient Rendering: GridView for optimal button layout performance
Minimal State Updates: Strategic use of setState() to minimize rebuilds
Static Logic: No object instantiation required for calculations

Getting Started
Prerequisites

Flutter SDK (latest stable version)
Dart SDK
IDE (VS Code, Android Studio, or IntelliJ)

Installation

Clone the repository
Run flutter pub get to install dependencies
Launch with flutter run

Project Structure
lib/
├── main.dart
├── models/
│   ├── calculator_button_model.dart
│   └── calculator_buttons_list.dart
├── services/
│   └── calculator_logic.dart
├── customWidgets/
│   ├── custom_results_screen.dart
│   ├── custom_grid_view.dart
│   └── custom_elevated_button.dart
└── screens/
└── calculator_form.dart
Testing Considerations
Recommended Test Coverage

Unit Tests: CalculatorLogic methods
Widget Tests: Individual custom widgets
Integration Tests: Complete user interaction flows
Edge Cases: Division by zero, invalid inputs, boundary conditions

Future Enhancement Opportunities

Scientific Functions: Trigonometric, logarithmic operations
Memory Functions: M+, M-, MR, MC
History Feature: Store and recall previous calculations
Themes: Multiple color schemes and dark mode
Landscape Mode: Enhanced layout for horizontal orientation
Accessibility: Screen reader support and larger text options


This documentation reflects the current implementation of the Simple 
Calculator App and serves as a reference for developers working on the 
project.