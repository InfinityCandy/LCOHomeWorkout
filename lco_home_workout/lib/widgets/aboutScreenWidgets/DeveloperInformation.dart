import 'package:flutter/material.dart';

class DeveloperInformation extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  DeveloperInformation({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: screenHeight * 0.03,
              left: screenHeight * 0.01,
              bottom: screenHeight * 0.02),
          child: Text("Luis Alejandro Salazar",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
        ),
        Container(
          margin: EdgeInsets.only(left: screenHeight * 0.01),
          child: Text("Fullstack web developer",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
        ),
        Container(
          margin: EdgeInsets.only(left: screenHeight * 0.01),
          child: Text("& mobile developer",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
