import 'package:flutter/material.dart';
import '../../helpers/TImerPainter.dart';

class TimerContainer extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final controller;

  //Constructor
  TimerContainer({
    @required this.screenHeight,
    @required this.screenWidth,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.015,
          right: screenWidth * 0.02,
          left: screenWidth * 0.02),
      height: screenHeight * 0.50,
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
        child: AnimatedBuilder(
          animation: controller,
          builder:
          (BuildContext context, Widget child) {
            return CustomPaint(
              painter: TimerPainter(
                animation: controller,
                backgroundColor: Color(0xFFE74292),
                color: Colors.red,
                screenHeight: screenHeight,
                screenWidth: screenWidth
              )
            );
          },
        ),
      ),
    );
  }
}