import 'package:flutter/material.dart';

class DeveloperPicture extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  DeveloperPicture({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.01),
        width: screenWidth * 0.35,
        decoration: BoxDecoration(
            color: Color(0xFFE74292),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/BenchPress.png")
            )
        )
    );
  }
}
