import 'package:flutter/material.dart';

class AppPriceText extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  AppPriceText({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 8),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Price for this app: ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        TextSpan(
            text: "\$120",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500))
      ])),
    );
  }
}
