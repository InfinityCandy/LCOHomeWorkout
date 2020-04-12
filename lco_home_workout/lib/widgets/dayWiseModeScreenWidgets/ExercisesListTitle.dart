import 'package:flutter/material.dart';

class ExecisesListTitle extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final weekdayName;

  //Constructor
  ExecisesListTitle({@required this.screenHeight, @required this.screenWidth, @required this.weekdayName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                top: screenHeight * 0.02, bottom: screenHeight * 0.010),
            child: Text(
              "Exercises List",
              style: TextStyle(
                  color: Color(0xFF2d2d2d),
                  fontSize: screenHeight * 0.034,
                  fontWeight: FontWeight.w700),
            )),
        Align(
          alignment: Alignment.centerLeft,
          child:
        Container(
            margin: EdgeInsets.only(
                left: screenWidth * 0.05,
                bottom: screenHeight * 0.010),
            child: Text(
              "Weekday: " + this.weekdayName,
              style: TextStyle(
                  color: Color(0xFF0E74292),
                  fontSize: screenHeight * 0.023,
                  fontWeight: FontWeight.w600),
            )))
      ],
    );
  }
}
