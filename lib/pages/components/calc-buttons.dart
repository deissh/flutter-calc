import 'package:flutter/material.dart';
import 'calc-row.dart';
import '../../calc.dart';

typedef void CalcButtonTapCallback({ String buttonText });

class CalcButtons extends StatelessWidget {
  CalcButtons({ @required this.onTap });

  final CalcButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CalcRow(
          buttons: [Calculations.SQR, Calculations.OPEN, Calculations.CLOSE, Calculations.DIVIDE],
          onTap: onTap,
        ),
        CalcRow(
          buttons: ['7', '8', '9', Calculations.MULTIPLY],
          onTap: onTap,
        ),
        CalcRow(
          buttons: ['4', '5', '6', Calculations.SUBTRACT],
          onTap: onTap,
        ),
        CalcRow(
          buttons: ['1', '2', '3', Calculations.ADD],
          onTap: onTap,
        ),
        CalcRow(
          buttons: [Calculations.PERIOD, '0', Calculations.CLEAR, Calculations.EQUALE],
          onTap: onTap,
        ),
      ],
    );
  }
}