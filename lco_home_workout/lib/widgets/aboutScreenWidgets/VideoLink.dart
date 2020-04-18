import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoLink extends StatelessWidget {
  final screenHeight;
  final screenWidth;

  VideoLink({@required this.screenHeight, @required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: screenWidth * 0.025, top: screenHeight * 0.023),
        child: InkWell(
          onTap: () => launch(
              "https://www.youtube.com/watch?v=VFrKjhcTAzE&list=WL&index=48&t=619s"),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Link to the video challenge: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text: "Youtube Video",
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline))
            ]),
          ),
        )
    );
  }
}
