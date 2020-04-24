import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  
  final Widget widget;

  FadePageRoute({@required this.widget}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widgetChild) {
      
      //If we want a different transitio we need to change this line
      return FadeTransition(opacity: animation, child: widgetChild);
    },

    //Returns the need screen specified by the route an animates its entraces
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
      return widget;
    }
  ); 
}