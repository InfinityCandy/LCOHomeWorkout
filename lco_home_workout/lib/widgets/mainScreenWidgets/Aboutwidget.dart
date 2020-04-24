import 'package:flutter/material.dart';

class Aboutwidget extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  Aboutwidget({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.035, bottom: screenHeight * 0.019),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/about");
          },
          child: Text(
            "Information about this APP",
            style: TextStyle(
                color: Color(0xFFE74292),
                fontSize: screenHeight * 0.027,
                decoration: TextDecoration.underline),
          ),
        ));
  }
}
