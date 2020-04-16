import 'package:flutter/material.dart';

class ExercisesListContainer extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final exercisesList;

  //Constructor
  ExercisesListContainer({
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.exercisesList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.005,
          right: screenWidth * 0.02,
          left: screenWidth * 0.02),
      height: screenHeight * 0.68,
      width: screenWidth,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(
            right: screenWidth * 0.005,
            left: screenWidth * 0.005,
            bottom: screenHeight * 0.025),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Container(
          margin: EdgeInsets.only(
            top: screenHeight * 0.015
          ),
          child: Column(
            children: <Widget>[
              ...this.exercisesList,
            ],
          ),
        ),
      ),
    );
  }
}