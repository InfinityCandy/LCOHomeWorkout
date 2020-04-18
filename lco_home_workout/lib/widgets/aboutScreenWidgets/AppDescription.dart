import 'package:flutter/material.dart';

class AppDescription extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  AppDescription({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.025, top: screenHeight * 0.025, right: screenWidth * 0.03),
      child: Text(
        "Simple app from the Hitesh Choudhary challenge. This app help you to follow a training routing and stay motivated",
        style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.w500),
      ),
    );
  }
}
