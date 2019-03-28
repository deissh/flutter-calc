import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../calc.dart';
import './components/calc-buttons.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  String calcString = '';
  // contains user errors
  String errordisc = '';
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  bool isNewEquation = true;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
    animation = new Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Калькулятор"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew),
            onPressed: () {
              DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                calcString,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CalcButtons(onTap: _onPressed)          
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  void _onPressed({ String buttonText }) {
    if (Calculations.OPERATIONS.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calcString += " $buttonText ";
      });
    }

    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calcString = "";
      });
    }

    if (buttonText == Calculations.EQUALE) {
      String newCalcString = Calculator.parseString(calcString);

      return setState(() {
        if (newCalcString != calcString) {
          calculations.add(calcString);
        }

        operations.add(Calculations.EQUALE);
        calcString = newCalcString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.PERIOD) {
      return setState(() {
        calcString = Calculator.addPeriod(calcString);
      });
    }

    setState(() {
      if (!isNewEquation && operations.length > 0 && operations.last == Calculations.EQUALE) {
        calcString = buttonText;
        isNewEquation = true;
      } else {
        calcString += buttonText;
      }
    });
  }
}