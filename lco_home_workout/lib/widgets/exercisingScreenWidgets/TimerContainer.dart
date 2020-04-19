import 'package:flutter/material.dart';
import '../../helpers/TImerPainter.dart';

class TimerContainer extends StatefulWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final controller;

  //Constructor
  TimerContainer({@required this.screenHeight, @required this.screenWidth, @required this.controller});

  @override
  State<StatefulWidget> createState() {
    return _TimerContainerState();
  }
}

class _TimerContainerState extends State<TimerContainer> {
  String get timerString {
    Duration duration = widget.controller.duration * widget.controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.screenHeight * 0.015,
          right: widget.screenWidth * 0.02,
          left: widget.screenWidth * 0.02),
      height: widget.screenHeight * 0.50,
      width: widget.screenWidth,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(
            right: widget.screenWidth * 0.005,
            left: widget.screenWidth * 0.005,
            bottom: widget.screenHeight * 0.025),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: AnimatedBuilder(
          animation: widget.controller,
          builder: (BuildContext context, Widget child) {
            return Stack(children: <Widget>[
              Positioned.fill(
                child: CustomPaint(
                  painter: TimerPainter(
                    animation: widget.controller,
                    backgroundColor: Color(0xFFE74292),
                    color: Color(0xFFd1d8e0),
                    screenHeight: widget.screenHeight,
                    screenWidth: widget.screenWidth))),
              Center(
                child: Text(
                  timerString,
                  style: TextStyle(fontSize: 90, color: Color(0xFFE74292)),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
