import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

typedef void CalcButtonTapCallback({ String buttonText });

class CalcButton extends StatelessWidget {
  CalcButton({ this.text, @required this.onTap });

  final String text;
  final CalcButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            width: 0.5,
          )
        ),
        child: FlatButton(
          onPressed: () => onTap(buttonText: text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          padding: EdgeInsets.all(30),
          highlightColor: Colors.blueGrey[100],
          splashColor: Colors.blueAccent[100],
        ),
      ),
    );
  }
}