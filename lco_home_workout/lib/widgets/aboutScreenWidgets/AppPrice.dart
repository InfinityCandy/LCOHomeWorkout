import 'package:flutter/material.dart';

class AppPriceText extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  AppPriceText({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.025, top: screenHeight * 0.023),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Price for this app: ",
            style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight * 0.018,
                fontWeight: FontWeight.w700)),
        TextSpan(
            text: "\$120",
            style: TextStyle(
                color: Colors.black, fontSize: screenHeight * 0.018, fontWeight: FontWeight.w500))
      ])),
    );
  }
}
