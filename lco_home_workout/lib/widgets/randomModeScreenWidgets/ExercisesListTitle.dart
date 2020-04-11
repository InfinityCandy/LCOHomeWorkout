import 'package:flutter/material.dart';

class ExecisesListTitle extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  ExecisesListTitle({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.010),
        child: Text(
          "Exercises List",
          style: TextStyle(
              color: Color(0xFF2d2d2d),
              fontSize: screenHeight * 0.034,
              fontWeight: FontWeight.w700),
        ));
  }
}
