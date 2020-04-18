import 'package:flutter/material.dart';

class DaywiseModeButton extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  DaywiseModeButton({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.061,
        width: screenWidth * 0.6,
        margin: EdgeInsets.only(
            top: screenHeight * 0.017, bottom: screenHeight * 0.027),
        child: RaisedButton(
          elevation: 4,
          color: Color(0xFFE74292),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Navigator.pushNamed(context, "/dayWise");
          },
          child: Text(
            "Daywise",
            style:
                TextStyle(color: Colors.white, fontSize: screenHeight * 0.04),
          ),
        ));
  }
}
