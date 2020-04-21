import 'package:flutter/material.dart';
import './screens/MainScreen.dart';
import './screens/RandomModeScreen.dart';
import './screens/DaywiseModeScreen.dart';
import './screens/ExercisingScreen.dart';
import './screens/AboutScreen.dart';
import './screens/CongratulationsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LCO Home Workout',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        "/": (BuildContext context) => CongratulationsScreen(),
        "/random": (BuildContext context) => RandomModeScreen(),
        "/dayWise": (BuildContext context) => DaywiseModeScreen(),
        "/exercising": (BuildContext context) => ExercisingScreen(),
        "/about": (BuildContext context) => AboutScreen(),
        "/congratulations": (BuildContext context) => CongratulationsScreen()
      },
    );
  }
}