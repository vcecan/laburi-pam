import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(title: 'Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('*', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  Widget CalcButton(String buttonText, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(buttonText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(82, 82),
        backgroundColor: txtcolor,
        elevation: 0,
        //shape: CircleBorder(),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 32,
          color: btncolor,
          fontWeight: FontWeight.w500,
          fontFamily: 'SF Pro Text',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f8f8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xff252c32)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 352,
                  child: Text(
                    equation,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 193, 98, 98),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 352,
                  child: Text(
                    result,
                    style: const TextStyle(
                        color: Color(0xFF252C32),
                        fontWeight: FontWeight.w500,
                        fontSize: 44,
                        fontFamily: 'SF Pro Text'),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
            width: 358,
            child: Divider(
              height: 0,
              thickness: 2,
              color: Color(0xffEEF0F2),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton(
                      'C', const Color(0xFFFF887D), const Color(0xfff8f8f8)),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 82,
                    width: 82,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton(
                      '⌫', const Color(0xFF11998E), const Color(0xfff8f8f8)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton(
                      '÷', const Color(0xFF11998E), const Color(0xfff8f8f8)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('7', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('8', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('9', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('*', const Color(0xFF11998E),
                          const Color(0xfff8f8f8)),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('4', const Color(0xffa9a7a7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('5', const Color(0xffa9a7a7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('6', const Color(0xffa9a7a7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('-', const Color(0xFF11998E),
                          const Color(0xfff8f8f8)),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('1', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('2', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('3', const Color(0xffA9A7A7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('+', const Color(0xFF11998E),
                          const Color(0xfff8f8f8)),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 82,
                        width: 82,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('0', const Color(0xffa9a7a7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('.', const Color(0xffa9a7a7),
                          const Color(0xfff8f8f8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('=', const Color(0xffEEF0F2),
                          const Color(0xff11998E)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
