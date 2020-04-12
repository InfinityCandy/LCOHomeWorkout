import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/dayWiseModeScreenWidgets/ExerciseCard.dart';
import '../widgets/dayWiseModeScreenWidgets/ExercisesListTitle.dart';
import '../widgets/dayWiseModeScreenWidgets/ExercisesListContainer.dart';
import '../models/ExerciseRoutine.dart';
import '../utilities/Constants.dart' as Constants;

class DaywiseModeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DaywiseModeScreenState();
  }
}

class _DaywiseModeScreenState extends State<DaywiseModeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _exerciseRoutine = ExerciseRoutine(numberOfSets: 0, selectedExercisesIndexs: null);

  String _getWeekDayName() {
    String weekdayName;
    DateTime date = DateTime.now();

    weekdayName = DateFormat('EEEE').format(date);

    return weekdayName;
  } //_getWeekDayName()

  Set<int> _getExercisesIndexs(String weekday) {
    List<int> exercisesIndexList = Constants.EXERCISES_PER_WEEK_DAY[weekday];
    Set<int> exercisesIndexSet = Set();

    for(int i = 0; i < exercisesIndexList.length; i++) {
      exercisesIndexSet.add(exercisesIndexList[i]);
    }
    
    return exercisesIndexSet;
  } //_getExercisesIndexs()

  List<Widget> _getSelectedExercisesCards(double screenHeight, double screenWidth, Set<int> exercisesIndexs) {
    List<Widget> exercises = <Widget>[];

    for(int exerciseIndex in exercisesIndexs) {
      exercises.add(ExerciseCard(screenHeight: screenHeight, screenWidth: screenWidth, exerciseIndex: exerciseIndex));
    }

    return exercises;
  } //getSelectedExercises()

  void _setNumberOfSets() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState..save();
      
      Navigator.pushReplacementNamed(context, "/exercisingScreen");
    }
  }//_validateSetsNumber()

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String weekdayName = _getWeekDayName();
    Set<int> selectedExercisesIndexs = _getExercisesIndexs(weekdayName);
    List<Widget> exercisesListWidgets = _getSelectedExercisesCards(screenHeight, screenWidth, selectedExercisesIndexs);

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
                ExercisesListContainer(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  exercisesTitle: ExecisesListTitle(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    weekdayName: weekdayName,
                  ),
                  exercisesList: exercisesListWidgets,
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
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                right: screenWidth * 0.06,
                                left: screenWidth * 0.06),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (String setsNumeber) {
                                if (setsNumeber == "") {
                                  return "Enter the number of sets you wish to do";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                _exerciseRoutine = ExerciseRoutine(numberOfSets: int.parse(value), selectedExercisesIndexs: selectedExercisesIndexs);
                              },
                              decoration: InputDecoration(
                                  labelText: "Number of set",
                                  labelStyle: TextStyle(
                                      color: Color(0xFF01CBC6),
                                      fontSize: screenHeight * 0.018),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF01CBC6), width: 2)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF01CBC6), width: 2)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                            )),
                        Container(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.73,
                          margin: EdgeInsets.only(top: screenHeight * 0.022),
                          child: RaisedButton(
                            elevation: 4,
                            color: Color(0xFF01CBC6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: _setNumberOfSets,
                            child: Text("Start Exercise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.027)),
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
