import 'package:flutter/material.dart';

class ReselectExercisesButton extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final Function reselectExercisesHandler;

  //Constructor
  ReselectExercisesButton({@required this.screenHeight, @required this.screenWidth, @required this.reselectExercisesHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.055,
        width: screenWidth * 0.73,
        margin: EdgeInsets.only(top: screenHeight * 0.02),
        child: RaisedButton(
          elevation: 4,
          color: Colors.pinkAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            this.reselectExercisesHandler();
          },
          child: Text("Reselect Exercises",
              style: TextStyle(
                  color: Colors.white, fontSize: screenHeight * 0.026)),
        ));
  }
}
