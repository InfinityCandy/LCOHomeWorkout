import 'package:flutter/material.dart';

class MainScreenLogo extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  MainScreenLogo({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.40,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/LCO_workout_logo.png"))),
    );
  }
}
