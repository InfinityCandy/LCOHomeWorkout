import 'package:flutter/material.dart';

class AppDescription extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  AppDescription({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 8),
      child: Text(
        "Simple app from the Hitesh Choudhary challenge. This app help you to follow a training routing and stay motivated",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
