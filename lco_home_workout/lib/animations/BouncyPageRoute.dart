import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  
  final Widget widget;

  BouncyPageRoute({@required this.widget}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widgetChild) {
      
      //If we want a different transitio we need to change this line
      return ScaleTransition(alignment:Alignment.center, scale: animation, child: widgetChild);
    },

    //Returns the need screen specified by the route an animates its entraces
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
      return widget;
    }
  ); 
}