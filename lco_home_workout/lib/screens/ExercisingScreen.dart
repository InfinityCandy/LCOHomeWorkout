import 'package:flutter/material.dart';
import '../widgets/exercisingScreenWidgets/ExercisesListContainer.dart';
import '../widgets/exercisingScreenWidgets/ExerciseCard.dart';
import '../widgets/exercisingScreenWidgets/TimerContainer.dart';
import '../utilities/Constants.dart' as Constants;
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
    int _exerciseIndexCounter = 0;
    bool _lastSet = false;
    int _setsCounter;
    bool _selectExercise;
    Map<String, ExerciseRoutine> _exerciseRoutineArgs;


    List<Widget> _getSelectedExercisesCards(double screenHeight, double screenWidth, Set<int> exercisesIndexs, int selectedExercise, bool selectExercise) {
    List<Widget> exercises = <Widget>[];

    for(int exerciseIndex in exercisesIndexs) {
      if(selectExercise) { 
        if(exerciseIndex == exercisesIndexs.elementAt(selectedExercise - 1)) {//Le quitamos "1" debido a que setState() se va a ejecutar antes que el método build() y eso va hacer que el contador de ejercicios siempre vaya uno arriba del ejercicio actual para cuando se ejecute build()
          exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, exerciseIndex: exerciseIndex, selected: true));
        }
        else {
          exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, exerciseIndex: exerciseIndex, selected: false));
        }
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
      value: 1 
    );

    _animationController.reverse(from: _animationController.value = 1);

    _selectExercise = false;
    _initTimeFlag = true;

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.dismissed) {
        _updateAnimationTime();
      } 
    });   
  }

  void _updateAnimationTime() {
    if(_exerciseTimeFlag == true) {
      setState(() {
        _animationController.duration = Duration(seconds: 40);
        _animationController.reverse(from: _animationController.value = 1);
        _exerciseTimeFlag = false;
        _restTimeFlag = true;
        _selectExercise = false;
      });
    }
    else {
      if(_restTimeFlag == true) {
        setState(() {
          _animationController.duration = Duration(seconds: 3);
          _animationController.reverse(from: _animationController.value = 1);
          _restTimeFlag = false;
          _initTimeFlag = true;
          _selectExercise = false;
        });
      }
      else {
        if(_initTimeFlag == true) {
          setState(() {
            int selectedExercise = _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs.elementAt(_exerciseIndexCounter);
            _exerciseIndexCounter = _exerciseIndexCounter + 1;
            
            int selectedExerciseTime = int.parse(Constants.EXERCISES_LIST[selectedExercise]["Duration"]);
            _animationController.duration = Duration(seconds: selectedExerciseTime);
            _animationController.reverse(from: _animationController.value = 1);
            _initTimeFlag = false;
            _exerciseTimeFlag = true;
            _selectExercise = true;
            if(_exerciseIndexCounter == _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs.length) {
              _setsCounter = _setsCounter - 1;

              if(_setsCounter == 0) {
                finishExercise();
              }
              else {
                _exerciseIndexCounter = 0;
              }
            }
          });
        }
      }
    }
  }

  void finishExercise() {
      Navigator.pop(context);
  }
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    _exerciseRoutineArgs = ModalRoute.of(context).settings.arguments as Map<String, ExerciseRoutine>;
    List<Widget> exercisesListWidgets = _getSelectedExercisesCards(screenHeight, screenWidth, _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs, _exerciseIndexCounter, _selectExercise);
    _setsCounter = _exerciseRoutineArgs["exerciseRoutine"].numberOfSets;

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
                          child: RaisedButton(
                            onPressed: () {
                              if(_animationController.isAnimating) {
                                _animationController.stop();
                                  setState(() {}); //We use setState() to update the botton's text
                                  }
                                  else {
                                    setState(() {}); //We use setState() to update the botton's text
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
                                child: _animationController.isAnimating ? Text("Stop Exercise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.027)) : Text("Resume Exercise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.027)) ,
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
              if(_animationController.isAnimating) {
                _animationController.stop();
              }
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
