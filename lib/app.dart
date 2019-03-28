import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/tabs.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TabsPage(),
    );
  }
}
