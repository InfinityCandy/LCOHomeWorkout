import 'package:flutter/material.dart';

class RandomModeButton extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;

  //Constructor
  RandomModeButton({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.061,
        width: screenWidth * 0.6,
        margin: EdgeInsets.only(bottom: screenHeight * 0.020),
        child: RaisedButton(
          elevation: 4,
          color: Color(0xFFE74292),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Navigator.pushNamed(context, "/random");
          },
          child: Text(
            "Random",
            style:
                TextStyle(color: Colors.white, fontFamily: "Arimo", fontWeight: FontWeight.w600, fontSize: screenHeight * 0.04),
          ),
        )
    );
  }
}
