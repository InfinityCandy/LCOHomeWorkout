import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  
  final Widget widget;
  final String transisitionType;

  SlidePageRoute({@required this.widget, @required this.transisitionType}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widgetChild) {
      switch(transisitionType){
        case "LR": //Left-to-right
          return SlideTransition(
            //If we want that the image comes from diferent sides we do the next:
            //Left-to-right: Offset(-1.0, 0.0)
            //Right-to-left: Offset(1.0, 0.0)
            //Top-to-bottom: Offset(0.0, -1.0)
            //Bottom-to-top: Offset(0.0, 1.0)
            position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(animation), 
            child: widgetChild);
        case "RL": //Right-to-left
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation), 
            child: widgetChild);
        case "TB": //Top-to-bottom
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(animation), 
            child: widgetChild);
        default: //Bottom-to-top
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(animation), 
            child: widgetChild);
      }


      //If we want a different transitio we need to change this line
      return SlideTransition(
        //If we want that the image comes from diferent sides we do the next:
        //Left-to-right: Offset(-1.0, 0.0)
        //Right-to-left: Offset(1.0, 0.0)
        //Top-to-bottom: Offset(0.0, -1.0)
        //Bottom-to-top: Offset(0.0, 1.0)
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation), 
        child: widgetChild);
    },

    //Returns the need screen specified by the route an animates its entraces
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
      return widget;
    }
  ); 
}