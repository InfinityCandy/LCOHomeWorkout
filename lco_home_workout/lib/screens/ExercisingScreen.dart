import 'package:flutter/material.dart';
import '../widgets/exercisingScreenWidgets/ExercisesListContainer.dart';
import '../widgets/exercisingScreenWidgets/ExerciseCard.dart';
import '../widgets/exercisingScreenWidgets/TimerContainer.dart';
import '../models/ExerciseRoutine.dart';

class ExercisingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExercisingScreen();
  }
}

class _ExercisingScreen extends State<ExercisingScreen> with TickerProviderStateMixin { //Investigar TickerProviderStateMixin
    AnimationController _animationController;
    bool _initTimeFlag = false;
    bool _exerciseTimeFlag = false;
    bool _restTimeFlag = false;
    List<Widget> _getSelectedExercisesCards(double screenHeight, double screenWidth, Set<int> exercisesIndexs) {
    List<Widget> exercises = <Widget>[];

    for(int exerciseIndex in exercisesIndexs) {
      if(exerciseIndex == 2) { //TODO... Hacer dinámico
        exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, exerciseIndex: exerciseIndex, selected: true));
      }
      else {
        exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, exerciseIndex: exerciseIndex, selected: false));
      }
    }

    return exercises;
  } //getSelectedExercises()

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), //The animation last 3 seconds at the beginning
    );

    _initTimeFlag = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final exerciseRoutineArgs = ModalRoute.of(context).settings.arguments as Map<String, ExerciseRoutine>;
    List<Widget> exercisesListWidgets = _getSelectedExercisesCards(screenHeight, screenWidth, exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.084),
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
                  TimerContainer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    controller: _animationController
                  ),
                  /*ExercisesListContainer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    exercisesList: exercisesListWidgets,
                  ),*/
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.02,
                      left: screenWidth * 0.02,
                      bottom: screenHeight * 0.01),
                    height: screenHeight * 0.15,
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
                          bottomLeft: Radius.circular(20)
                        )
                      ),
                    child: Center(
                      child: Container(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.73,
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (BuildContext context, child) {
                              return RaisedButton(
                                onPressed: () {
                                  if(_animationController.isAnimating) {
                                    _animationController.stop();
                                  }
                                  else {
                                    //If animation.value is 0.0 then turn it into one to start the animation again
                                    //If animation.value is different from 0.0 then set it's value the same value, so the animation can continue where it stoped
                                    _animationController.reverse(
                                    from: _animationController.value == 0.0
                                    ? 1.0
                                    : _animationController.value);
                                  }
                                },
                                elevation: 4,
                                color: Color(0xFF01CBC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                                child: Text("Start Exercise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.027)),
                              );
                            }, 
                          )
                      ),
                    ),
                  ), 
                )],
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          height: screenHeight * 0.08,
          width: screenHeight * 0.08,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 4,
            child: Icon(
              Icons.home,
              size: screenHeight * 0.047,
            ),
            backgroundColor: Color(0xFFae37d2),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop);
  }
}
