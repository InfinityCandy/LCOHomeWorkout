import 'package:flutter/material.dart';

class ExercisesListContainer extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final exercisesTitle;
  final exercisesList;
  final reselectExercisesButton;

  //Constructor
  ExercisesListContainer({
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.exercisesTitle,
    @required this.exercisesList,
    @required this.reselectExercisesButton
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.015,
          right: screenWidth * 0.02,
          left: screenWidth * 0.02),
      height: screenHeight * 0.82,
      width: screenWidth,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(
            right: screenWidth * 0.005,
            left: screenWidth * 0.005,
            bottom: screenHeight * 0.025),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          children: <Widget>[
            this.exercisesTitle,
            ...this.exercisesList,
            this.reselectExercisesButton,
          ],
        ),
      ),
    );
  }
}
