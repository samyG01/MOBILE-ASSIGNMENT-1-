import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "⌫") {
        _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
      } else if (buttonText == "+") {
        num1 = double.parse(output);
        operand = "+";
        _output = "0";
      } else if (buttonText == "-") {
        num1 = double.parse(output);
        operand = "-";
        _output = "0";
      } else if (buttonText == "×") {
        num1 = double.parse(output);
        operand = "×";
        _output = "0";
      } else if (buttonText == "÷") {
        num1 = double.parse(output);
        operand = "÷";
        _output = "0";
      } else if (buttonText == "=") {
        num2 = double.parse(output);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        } else if (operand == "-") {
          _output = (num1 - num2).toString();
        } else if (operand == "×") {
          _output = (num1 * num2).toString();
        } else if (operand == "÷") {
          _output = (num1 / num2).toString();
        }
        num1 = 0;
        num2 = 0;
        operand = "";
      } else {
        _output = _output == "0" ? buttonText : _output + buttonText;
      }
      output = _output;
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                output,
                style: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Column(
            children: [
              buildRow(["C", "+/-", "%", "÷"], Colors.grey),
              buildRow(["7", "8", "9", "×"], Colors.grey[900]!),
              buildRow(["4", "5", "6", "-"] , Colors.grey[900]!),
              buildRow(["1", "2", "3", "+"], Colors.grey[900]!),
              buildRow([".", "0", "⌫", "="], Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> buttons, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((btn) => buildButton(btn, btn == "=" ? Colors.blue : color)).toList(),
    );
  }
}
