import 'package:flutter/material.dart';
import '../../utilities/Constants.dart' as Constants;

class ExerciseCard extends StatelessWidget {
  //Attributes
  final screenHeight;
  final screenWidth;
  final exerciseIndex;
  final selected;

  //Constructor
  ExerciseCard(
      {@required this.screenHeight,
      @required this.screenWidth,
      @required this.exerciseIndex, 
      @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.123,
      width: screenWidth * 0.95,
      child: Card(
        shape: selected ? RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10)) 
          : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10))
        ,
        margin: EdgeInsets.only(
            top: screenHeight * 0.01,
            right: screenWidth * 0.02,
            bottom: screenHeight * 0.01,
            left: screenWidth * 0.02),
        elevation: 5,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: screenWidth * 0.025),
              width: screenWidth * 0.20,
              decoration: BoxDecoration(
                  color: Color(0xFFE74292),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          Constants.EXERCISES_LIST[exerciseIndex]["Asset"]))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.045),
                  child: Text(
                    "Exercise: " +
                        Constants.EXERCISES_LIST[exerciseIndex]["ExerciseName"],
                    style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.045),
                  child: Text(
                    "Duration: " +
                        Constants.EXERCISES_LIST[exerciseIndex]["Duration"],
                    style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}