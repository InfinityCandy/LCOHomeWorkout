import 'package:flutter/material.dart';
import '../widgets/mainScreenWidgets/MainScreenLogo.dart';
import '../widgets/mainScreenWidgets/SelectModeText.dart';
import '../widgets/mainScreenWidgets/RandomModeButton.dart';
import '../widgets/mainScreenWidgets/DaywiseModeButton.dart';
import '../widgets/mainScreenWidgets/Aboutwidget.dart';

class MainScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.080),
        child: AppBar(
          title: Image.asset("assets/images/LCO_workout_logo.png",
              fit: BoxFit.contain),
          backgroundColor: Color(0xFFae37d2),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0x22d1d8e0)),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.015, right: screenWidth * 0.02, left: screenWidth * 0.02),
            height: screenHeight * 0.83,
            width: screenWidth,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  MainScreenLogo(screenHeight: screenHeight, screenWidth: screenWidth),
                  SelectModeText(screenHeight: screenHeight, screenWidth: screenWidth),
                  RandomModeButton(screenHeight: screenHeight, screenWidth: screenWidth),
                  DaywiseModeButton(screenHeight: screenHeight, screenWidth: screenWidth),
                  Aboutwidget(screenHeight: screenHeight, screenWidth: screenWidth),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.035,
                        top: MediaQuery.of(context).size.height * 0.015,
                        right: MediaQuery.of(context).size.width * 0.035),
                    child: Divider(
                      color: Color(0xFFE74292),
                      thickness: 2.5,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
