import 'dart:math' as math;

class Calculations {
  static const PERIOD = '.';
  static const MULTIPLY = '*';
  static const ADD = '+';
  static const SUBTRACT = '-';
  static const DIVIDE = '/';
  static const SQRT = '√';
  static const SQR = '^';
  static const MODULE = '|x|';
  static const CLEAR = 'C';
  static const EQUALE = '=';
  static const OPERATIONS = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDE,
    Calculations.SQR,
    Calculations.SQRT
  ];

  static double add(double x, double y) { return x + y; }
  static double subtract(double x, double y) { return x - y; }
  static double divide(double x, double y) { return x / y; }
  static double multiply(double x, double y) { return x * y; }
  static double sqr(double x, double y) { return math.pow(x, y); }
  static double sqrt(double x) { return math.sqrt(x); }
}

class Calculator {
  static String parseString(String text) {
    List<String> numberToAdd;
    double x, y, result;

    if (text.contains(Calculations.ADD)) {
      numberToAdd = text.split(Calculations.ADD);
      x = double.parse(numberToAdd[0]);
      y = double.parse(numberToAdd[1]);

      result = Calculations.add(x, y);
    } else if (text.contains(Calculations.SUBTRACT)) {
      numberToAdd = text.split(Calculations.SUBTRACT);
      x = double.parse(numberToAdd[0]);
      y = double.parse(numberToAdd[1]);

      result = Calculations.subtract(x, y);
    } else if (text.contains(Calculations.DIVIDE)) {
      numberToAdd = text.split(Calculations.DIVIDE);
      x = double.parse(numberToAdd[0]);
      y = double.parse(numberToAdd[1]);

      result = Calculations.divide(x, y);
    } else if (text.contains(Calculations.MULTIPLY)) {
      numberToAdd = text.split(Calculations.MULTIPLY);
      x = double.parse(numberToAdd[0]);
      y = double.parse(numberToAdd[1]);

      result = Calculations.multiply(x, y);
    } else if (text.contains(Calculations.SQR)) {
      numberToAdd = text.split(Calculations.SQR);
      x = double.parse(numberToAdd[0]);
      y = double.parse(numberToAdd[1]);

      result = Calculations.sqr(x, y);
    } else if (text.contains(Calculations.SQRT)) {
      numberToAdd = text.split(Calculations.SQRT);
      y = double.parse(numberToAdd[1]);

      result = Calculations.sqrt(y);
    } else {
      return text;
    }

    // todo: number format
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
        : str +=Calculations.PERIOD;
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