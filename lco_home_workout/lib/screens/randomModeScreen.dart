import 'package:flutter/material.dart';
import 'dart:math';

class RandomModeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomModeScreenState();
  }
}

class _RandomModeScreenState extends State<RandomModeScreen> {
  var selectedExercisesList = <Widget>[];
  final exercisesList = const [
    {
      "0": {
        "ExerciseName": "Assisted Press",
        "Duration": "1 Minutes",
        "Asset": "assets/images/AssistedPress.png"
      },
      "1": {
        "ExerciseName": "Ball Pushup",
        "Duration": "2 Minutes",
        "Asset": "assets/images/BallPushups.png"
      },
      "2": {
        "ExerciseName": "Bench Press",
        "Duration": "1 Minute",
        "Asset": "assets/images/BenchPress.png"
      },
      "3": {
        "ExerciseName": "Bicep Curls",
        "Duration": "5 Minutes",
        "Asset": "assets/images/BicepsCurls.png"
      },
      "4": {
        "ExerciseName": "Crunches",
        "Duration": "1 Minute",
        "Asset": "assets/images/Crunches.png"
      },
      "5": {
        "ExerciseName": "Dumbell Pushup",
        "Duration": "2 Minutes",
        "Asset": "assets/images/DumbellPushups.png"
      },
      "6": {
        "ExerciseName": "Incline Bench P.",
        "Duration": "2 Minutes",
        "Asset": "assets/images/InclineBenchPress.png"
      },
      "7": {
        "ExerciseName": "One Leg Balance",
        "Duration": "8 Minutes",
        "Asset": "assets/images/OneLegBalance.png"
      },
      "8": {
        "ExerciseName": "Sitted Row",
        "Duration": "45 Seconds",
        "Asset": "assets/images/SittedRows.png"
      }
    }
  ];

  List<Widget> getSelectedExercises() {
    Random random = new Random();
    List<Widget> exercises = <Widget>[];

    for (var i = 0; i < 5; i++) {
      int randomNumber = 0 + random.nextInt(8 - 0);

      exercises.add(Container(
        height: 110,
        width: 400,
        child: Card(
          margin: EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 85,
                decoration: BoxDecoration(
                    color: Color(0xFFE74292),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(exercisesList[0]
                            [randomNumber.toString()]["Asset"]))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Exercise: " +
                          exercisesList[0][randomNumber.toString()]
                              ["ExerciseName"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Duration: " +
                          exercisesList[0][randomNumber.toString()]["Duration"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ));
    }

    return exercises;
  } //getSelectedExercises()

  @override
  void initState() {
    selectedExercisesList = getSelectedExercises();
    super.initState();
  }

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
              margin: EdgeInsets.only(
                  top: screenHeight * 0.015,
                  right: screenWidth * 0.02,
                  left: screenWidth * 0.02),
              height: screenHeight * 0.83,
              width: screenWidth,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Exercises List",
                            style: TextStyle(
                                color: Color(0xFF2d2d2d),
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          )),
                      ...selectedExercisesList,
                      Container(
                          height: 50,
                          width: 300,
                          margin: EdgeInsets.only(top: 20),
                          child: RaisedButton(
                            elevation: 4,
                            color: Color(0xFFBB2CD9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Text("Reselect Exercises",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          )),
                      Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.only(top: 20, bottom: 15),
                        child: RaisedButton(
                          elevation: 4,
                          color: Color(0xFFBB2CD9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Text("Start Exercise!!!!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
