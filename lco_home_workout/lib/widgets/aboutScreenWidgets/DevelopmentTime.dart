import 'package:flutter/material.dart';

class DevelopmentTimeText extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  DevelopmentTimeText(
      {@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.025, top: screenHeight * 0.020),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Development time: ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: "28 hours aprox.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w500))
        ]),
      ),
    );
  }
}
