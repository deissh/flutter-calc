import 'package:flutter/material.dart';
import './calc-button.dart';

typedef void CalcButtonTapCallback({ String buttonText });

class CalcRow extends StatelessWidget {
  CalcRow({ @required this.buttons, @required this.onTap });

  final List<String> buttons;
  final CalcButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];
    buttons.forEach((String btnText) {
      rowButtons.add(
        CalcButton(
          text: btnText,
          onTap: onTap
        )
      );
    });

    return rowButtons;
  }
}