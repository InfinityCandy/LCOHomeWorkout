import 'package:flutter/material.dart';
import 'package:lco_home_workout/widgets/aboutScreenWidgets/VideoLink.dart';
import '../aboutScreenWidgets/DeveloperPicture.dart';
import '../aboutScreenWidgets/AppDescription.dart';
import '../aboutScreenWidgets/DevelopmentTime.dart';
import '../aboutScreenWidgets/AppPrice.dart';
import '../aboutScreenWidgets/DeveloperInformation.dart';

class AboutCard extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  AboutCard({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.43,
      width: screenWidth,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
            top: screenHeight * 0.02,
            right: screenWidth * 0.02,
            bottom: screenHeight * 0.01,
            left: screenWidth * 0.02),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Container(
                height: screenHeight * 0.15,
                margin: EdgeInsets.only(top: screenHeight * 0.01),
                child: Row(
                  children: <Widget>[
                    DeveloperPicture(screenHeight: screenHeight, screenWidth: screenWidth),
                    DeveloperInformation(screenHeight: screenHeight, screenWidth: screenWidth),
                  ],
                )),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppDescription(screenHeight: screenHeight, screenWidth: screenWidth),
                  DevelopmentTimeText(screenHeight: screenHeight, screenWidth: screenWidth),
                  AppPriceText(screenHeight: screenHeight, screenWidth: screenWidth),
                  VideoLink(screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
