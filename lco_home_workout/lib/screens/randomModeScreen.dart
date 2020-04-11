import 'package:flutter/material.dart';
import '../widgets/randomModeScreenWidgets/ExerciseCard.dart';
import '../widgets/randomModeScreenWidgets/ExercisesListTitle.dart';
import '../widgets/randomModeScreenWidgets/ReselectExercisesButton.dart';
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


  List<Widget> _getSelectedExercises(double screenHeight, double screenWidth) {
    Random random = new Random();
    List<Widget> exercises = <Widget>[];

    for (var i = 0; i < 5; i++) {
      int randomNumber = 0 + random.nextInt(8 - 0);
      exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, randomNumber: randomNumber));
    }

    return exercises;
  } //getSelectedExercises()

  @override
  void initState() {
    super.initState();
  }//initState()

  void _validateSetsNumber() {
    if (_formKey.currentState.validate()) {
      print("Hola");
    }
    else {
      print("No hola");
    }
  }//_validateSetsNumber()

  void _reselectExercises() {
    setState(() {});
  }//_reselectExercises()

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Widget> exercisesListWidgets = _getSelectedExercises(screenHeight, screenWidth);

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
                        ExecisesListTitle(screenHeight: screenHeight, screenWidth: screenWidth),
                        ...exercisesListWidgets,
                        ReselectExercisesButton(screenHeight: screenHeight, screenWidth: screenWidth, reselectExercisesHandler: _reselectExercises),
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
