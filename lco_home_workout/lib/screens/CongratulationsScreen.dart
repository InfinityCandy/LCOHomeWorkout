import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import '../widgets/congratulationsWidgets/CongratulationsCard.dart';

class CongratulationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //Allows the screen to block or go to sleep
    Wakelock.disable();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.080),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset("assets/images/LCO_workout_logo.png",
              fit: BoxFit.contain),
          backgroundColor: Color(0xFFae37d2),
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Color(0x22d1d8e0)),
        ),
        SingleChildScrollView(
          child: CongratulationsCard(screenHeight: screenHeight, screenWidth: screenWidth),
        )
      ]),
    );
  }
}