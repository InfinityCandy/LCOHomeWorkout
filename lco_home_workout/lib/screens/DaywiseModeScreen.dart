import 'package:flutter/material.dart';

class DaywiseModeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold (
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.080),
        child: AppBar(
          title: Image.asset("assets/images/LCO_workout_logo.png",
              fit: BoxFit.contain),
          backgroundColor: Color(0xFFae37d2),
        ),
      ),
      body: Container(child: Text("TODO"),),
    );
  }
}