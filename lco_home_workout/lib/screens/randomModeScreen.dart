import 'package:flutter/material.dart';
import 'dart:math';

class RandomModeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomModeScreenState();
  }
}

class _RandomModeScreenState extends State<RandomModeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  List<Widget> getSelectedExercises(double screenHeight, double screenWidth) {
    Random random = new Random();
    List<Widget> exercises = <Widget>[];

    for (var i = 0; i < 5; i++) {
      int randomNumber = 0 + random.nextInt(8 - 0);

      exercises.add(Container(
        height: screenHeight * 0.123,
        width: screenWidth * 0.95,
        child: Card(
          margin: EdgeInsets.only(
            top: screenHeight * 0.01, 
            right: screenWidth * 0.02, 
            bottom: screenHeight * 0.01, 
            left: screenWidth * 0.02),
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.025
                ),
                width: screenWidth * 0.20,
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
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.045
                    ),
                    child: Text(
                      "Exercise: " +
                          exercisesList[0][randomNumber.toString()]
                              ["ExerciseName"],
                      style:
                          TextStyle(fontSize: screenHeight * 0.022, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.045
                    ),
                    child: Text(
                      "Duration: " +
                          exercisesList[0][randomNumber.toString()]["Duration"],
                      style:
                          TextStyle(fontSize: screenHeight * 0.022, fontWeight: FontWeight.w500),
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
    super.initState();
  }

  void _validateSetsNumber() {
    if (_formKey.currentState.validate()) {
      print("Hola");
    }
    else {
      print("No hola");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(0x22d1d8e0)),
            ),
            SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.015,
                      right: screenWidth * 0.02,
                      left: screenWidth * 0.02),
                  height: screenHeight * 0.82,
                  width: screenWidth,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.005, 
                      left: screenWidth * 0.005, 
                      bottom: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.02, 
                              bottom: screenHeight * 0.010),
                            child: Text(
                              "Exercises List",
                              style: TextStyle(
                                  color: Color(0xFF2d2d2d),
                                  fontSize: screenHeight * 0.034,
                                  fontWeight: FontWeight.w700),
                            )),
                        ...getSelectedExercises(screenHeight, screenWidth),
                        Container(
                            height: screenHeight * 0.055,
                            width: screenWidth * 0.73,
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.02
                            ),
                            child: RaisedButton(
                              elevation: 4,
                              color: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {},
                              child: Text("Reselect Exercises",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: screenHeight * 0.026)),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.02,
                      left: screenWidth * 0.02,
                      bottom: screenHeight * 0.01),
                  height: screenHeight * 0.23,
                  width: screenWidth,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.005, 
                      left: screenWidth * 0.005, 
                      bottom: screenHeight * 0.020),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                      children: <Widget>[
                        Container(
                            margin:
                                EdgeInsets.only(
                                  top: screenHeight * 0.02, 
                                  right: screenWidth * 0.06, 
                                  left: screenWidth * 0.06),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (String setsNumeber) {
                                if(setsNumeber == "") {
                                  return "Enter the number of sets you wish to do";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: "Number of set",
                                labelStyle: TextStyle(color: Color(0xFF01CBC6), fontSize: screenHeight * 0.018),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF01CBC6), width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF01CBC6), width: 2)),
                                errorBorder: UnderlineInputBorder (
                                  borderSide: BorderSide(color: Colors.red, width: 2)
                                )
                              ),
                            )),
                        Container(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.73,
                          margin: EdgeInsets.only(
                            top: screenHeight * 0.022
                          ),
                          child: RaisedButton(
                            elevation: 4,
                            color: Color(0xFF01CBC6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: _validateSetsNumber,
                            child: Text("Start Exercise",
                                style: TextStyle(
                                    color: Colors.white, fontSize: screenHeight * 0.027)),
                          ),
                        ),
                      ],
                    ))),
                  ),
                )
              ],
            ))
          ],
        ),
        floatingActionButton: Container(
          height: screenHeight * 0.08, 
          width: screenHeight * 0.08, 
          child: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);
          },
          elevation: 4,
          child: Icon(Icons.home, size: screenHeight * 0.047,),
          backgroundColor: Color(0xFFae37d2),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,);
  }
}
