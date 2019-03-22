import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterlearn/pages/tabs/search.dart';
import 'package:flutterlearn/pages/tabs/home.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

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
      body: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text("Главная")
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              title: Text("Поиск")
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.reply),
              title: Text("Уведомления")
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              title: Text("Профиль")
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return HomePage();
                  break;
                case 1:
                  return SearchPage();
                  break;
                case 2:
                  return SearchPage();
                  break;
                default:
                  return Container();
              }
            },
          );
        },
      )
    );
  }
}