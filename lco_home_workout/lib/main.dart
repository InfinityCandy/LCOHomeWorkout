import 'package:flutter/material.dart';
import './screens/MainScreen.dart';
import './screens/RandomModeScreen.dart';
import './screens/DaywiseModeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LCO Home Workout',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        "/": (BuildContext context) => MainScreen(),
        "/randomMode": (BuildContext context) => RandomModeScreen(),
        "/dayWiseMode": (BuildContext context) => DaywiseModeScreen()
      },
    );
  }
}