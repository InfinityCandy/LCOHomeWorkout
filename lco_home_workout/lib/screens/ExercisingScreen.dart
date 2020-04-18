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
    List<Widget> _getSelectedExercisesCards(double screenHeight, double screenWidth, Set<int> exercisesIndexs) {
    List<Widget> exercises = <Widget>[];

    for(int exerciseIndex in exercisesIndexs) {
      if(exerciseIndex == 1) { //TODO... Hacer dinámico
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
      duration: Duration(seconds: 5),
    );
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
                  ExercisesListContainer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    exercisesList: exercisesListWidgets,
                  ),
                ],
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
