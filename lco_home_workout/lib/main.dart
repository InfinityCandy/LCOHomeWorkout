import 'package:flutter/material.dart';
import './screens/MainScreen.dart';
import './screens/RandomModeScreen.dart';
import './screens/DaywiseModeScreen.dart';
import './screens/ExercisingScreen.dart';
import './screens/AboutScreen.dart';
import './screens/CongratulationsScreen.dart';
import './animations/SlidePageRoute.dart';
import './animations/BouncyPageRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LCO Home Workout',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => MainScreen());
          case "/random":
            return SlidePageRoute(widget: RandomModeScreen(), transisitionType: "RL");
          case "/dayWise":
            return SlidePageRoute(widget: DaywiseModeScreen(), transisitionType: "RL");
          case "/exercising":
            final args = settings.arguments;
            return BouncyPageRoute(widget: ExercisingScreen(exerciseRoutineArgs: args));
          case "/about":
            return SlidePageRoute(widget: AboutScreen(), transisitionType: "LR");
          case "/congratulations":
            return SlidePageRoute(widget: CongratulationsScreen(), transisitionType: "BT");
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