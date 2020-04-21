import 'package:flutter/material.dart';


class CongratulationsCard extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  CongratulationsCard({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.83,
      width: screenWidth,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(
          top: screenHeight * 0.02,
          right: screenWidth * 0.02,
          bottom: screenHeight * 0.01,
          left: screenWidth * 0.02),
        elevation: 5,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.09, left: screenWidth * 0.03),
                width: screenWidth * 0.55,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFFE74292),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/CongratulationsIcon.png")
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.015),
                child: Text("Congratulations!", style: TextStyle(fontSize: screenHeight * 0.034, fontWeight: FontWeight.w500),),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.033),
                child: Text("You finished your training", style: TextStyle(fontSize: screenHeight * 0.034, fontWeight: FontWeight.w500),),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.045),
                height: 55,
                child: RaisedButton.icon(
                  elevation: 4,
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.home, color: Colors.white, size: screenHeight * 0.047),
                  label: Text("Back to home screen", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: screenHeight * 0.026,
                      fontWeight: FontWeight.w600
                    )
                  )
                ),
              )
            ],
          )
        )
      )
    );
  }
}