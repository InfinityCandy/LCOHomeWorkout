import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor; 
  final Color color;
  final screenHeight;
  final screenWidth;

  TimerPainter({@required this.animation, @required this.backgroundColor, @required this.color, @required this.screenHeight, @required this.screenWidth}) 
  :super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;
      
    canvas.drawCircle(Offset(this.screenWidth * 0.475, this.screenHeight * 0.235), size.width / 2.5, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Rect.fromCircle(center: Offset(this.screenWidth * 0.475, this.screenHeight * 0.235), radius: size.width / 2.5), math.pi * 1.5, progress, false, paint);
  }
  
@override
bool shouldRepaint(TimerPainter old) {
  if(animation.value != old.animation.value) {
    return true;
  }
  else {
    return false;
  }
}

}