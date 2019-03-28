import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/tabs.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Super Calculator',
          theme: theme,
          home: TabsPage(),
        );
      }
    );
  }
}
