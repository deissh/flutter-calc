import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class Calculations {
  static const PERIOD = '.';
  static const MULTIPLY = '*';
  static const ADD = '+';
  static const SUBTRACT = '-';
  static const DIVIDE = '/';
  static const SQR = '^';
  static const OPEN = '(';
  static const CLOSE = ')';
  static const CLEAR = 'C';
  static const EQUALE = '=';
  static const OPERATIONS = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDE,
    Calculations.SQR,
    Calculations.OPEN,
    Calculations.CLOSE
  ];

  static double add(double x, double y) { return x + y; }
  static double subtract(double x, double y) { return x - y; }
  static double divide(double x, double y) { return x / y; }
  static double multiply(double x, double y) { return x * y; }
  static double sqr(double x, double y) { return math.pow(x, y); }
}

class Calculator {
  static String parseString(String text) {

    Parser p = new Parser();
    Expression exp = p.parse(text);
    ContextModel cm = new ContextModel();

    double result = exp.evaluate(EvaluationType.REAL, cm);

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String str) {
    if (str.isEmpty) {
      return str = '0${Calculations.PERIOD}';
    }

    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(str);
    int maxMatches = Calculator.includesOperation(str) ? 2: 1;

    return matches.length == maxMatches
        ? str
        : str += Calculations.PERIOD;
  }

  static bool includesOperation(String str) {
    for (var op in Calculations.OPERATIONS) {
      if (str.contains(op)) {
        return true;
      }
    }

    return false;
  }
}

class NumberFormatter {
  static String format(String text) {
    double parseNumber = double.parse(text);

    if ((parseNumber == parseNumber.floor()) && (parseNumber != double.infinity)) {
      return parseNumber.truncate().toString();
    }

    return text;
  }
}