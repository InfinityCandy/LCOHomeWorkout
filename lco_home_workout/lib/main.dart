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
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => MainScreen());
          case "/random":
            return MaterialPageRoute(builder: (_) => RandomModeScreen());
          case "/dayWise":
            return MaterialPageRoute(builder: (_) => DaywiseModeScreen());
          case "/exercising":
            final args = settings.arguments;
            return MaterialPageRoute(builder: (_) => ExercisingScreen(exerciseRoutineArgs: args));
          case "/about":
            return MaterialPageRoute(builder: (_) => AboutScreen());
          case "/congratulations":
            return MaterialPageRoute(builder: (_) => CongratulationsScreen());
          default:
            return MaterialPageRoute(builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                  ));
        }
      },
    );
  }
}