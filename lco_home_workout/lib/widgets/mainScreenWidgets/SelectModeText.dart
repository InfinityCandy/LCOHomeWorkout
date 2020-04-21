import 'package:flutter/material.dart';

class SelectModeText extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  SelectModeText({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.045),
      child: Text(
        "SELECT A MODE",
        style: TextStyle(
          fontFamily: "Poppins",
            color: Color(0xFF2d2d2d),
            fontSize: screenHeight * 0.040,
            fontWeight: FontWeight.w700
            ),
      ),
    );
  }
}
