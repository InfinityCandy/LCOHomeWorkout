import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
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

class _ExercisingScreen extends State<ExercisingScreen> with TickerProviderStateMixin { 
  //Attributes
  AnimationController _animationController;
  bool _initTimeFlag = false;
  bool _exerciseTimeFlag = false;
  bool _restTimeFlag = false;
  int _exerciseIndexCounter = 0;
  int _setsCounter;
  bool _finishExerciseFlag = false;
  bool _isThereselectExercise;
  AudioPlayer _advancedPlayer;
  Map<String, ExerciseRoutine> _exerciseRoutineArgs;


  /*
  * Gets the selected exercises cards to display them on the screen while the traning is running and does it indicating the exercise that is currently perfomed
  * @param screenHeight: Screen height
  * @param screenWidth: Screen width
  * @exercisesIndexs: A set with the index of the exercises that must be performed during the traning session
  * @performedExercise: The index of the current exercise that is being performed 
  * @isThereSelectExercise: A boolean value that indicates if the exercising time already begun to indicate the exercise to be perform on the screen
  * return a List of "Card()" type widgets
  */
  List<Widget> _getSelectedExercisesCards(double screenHeight, double screenWidth, Set<int> exercisesIndexs, int performedExercise, bool isThereSelectExercise) {
    List<Widget> exercises = <Widget>[];

    for(int exerciseIndex in exercisesIndexs) {
      if(isThereSelectExercise) {  
        if(exerciseIndex == exercisesIndexs.elementAt(performedExercise - 1)) {//We have to sustract "-1" beacuase setState() executes before the build() method, so that is going to make that the exercise's counter always goes one in front of the current exercisee that the user needs to performe, this is due to the Set<> starts at 0
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

    //The timer's animation initial values
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), //The animation last 3 seconds at the beginning
      value: 1
    );
    //The timer's animation should starts as soon as the exercising screen appears
    _animationController.reverse(from: _animationController.value = 1);

    _isThereselectExercise = false; //Indicates if in this state we are going to indicate if an exercise is being perfomed on the screen

    //The series of flags we are going to use during the entire life of the current screen
    _restTimeFlag = false; //Indicates if the resting period begun
    _finishExerciseFlag = false; //Indicates if the user already finished the exercise
    _initTimeFlag = true; //Indicates if the preparation period begun

    //We add a listener to the animatiion to listen when the timer's animation stops, to update its status
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.dismissed) {
        _updateExercisePeriod();
      } 
    });   
  }

  /*
  * Upadte the status of the current exercise period, based on the old exercise period using the setted flags (_exerciseTimeFlag, _restTimeFlag and _restTimeFlag)
  */
  void _updateExercisePeriod() {
    //If the "_finishExerciseFlag" is true, the we stop the exercise
    if(_finishExerciseFlag == true) {
      finishExercise();
    }
    else {
      //If the "_exerciseTimeFlag" is true that means that the user just finished his/her last exercise, so we start the resting period
      if(_exerciseTimeFlag == true) {
      setState(() {
          _animationController.duration = Duration(seconds: 40);
          _animationController.reverse(from: _animationController.value = 1);
          pauseMusicPlaying();
          //The exercise time is over
          _exerciseTimeFlag = false;
          //The rest time begins
          _restTimeFlag = true;
          //We don't need to display the current exercise on the screen, because there is not current exercise
          _isThereselectExercise = false;
        });
      }
      else {
        //If the "_restTimeFlag" is ture that means that the resting period just finished and we need to intialize the exercise within 3 seconds
        if(_restTimeFlag == true) {
          setState(() {
            _animationController.duration = Duration(seconds: 3);
            _animationController.reverse(from: _animationController.value = 1);
            //The rest time is over
            _restTimeFlag = false;
            //The 3 seconds init time begins
            _initTimeFlag = true;
            //We don't need to display the current exercise on the screen, because there is not current exercise
            _isThereselectExercise = false;
          });
        }
        else {
          //If the "_initTimeFlag" is true that means that the user is about to resume his/her exercise right now
          if(_initTimeFlag == true) {
            setState(() {
              int selectedExercise = _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs.elementAt(_exerciseIndexCounter);
              int selectedExerciseTime = int.parse(Constants.EXERCISES_LIST[selectedExercise]["Duration"]);
              playSelectedMusic(Constants.EXERCISES_LIST[selectedExercise]["Music"]);
              _animationController.duration = Duration(seconds: selectedExerciseTime);
              _animationController.reverse(from: _animationController.value = 1);

              _exerciseIndexCounter = _exerciseIndexCounter + 1;
              if(_exerciseIndexCounter > _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs.length - 1) {
                _setsCounter = _setsCounter - 1;

                if(_setsCounter == 0) {
                  _finishExerciseFlag = true;
                }
                else {
                  _exerciseIndexCounter = 0;
                }
              }

              //The 3 seconds init time is over
              _initTimeFlag = false;
              //The exercising time begins
              _exerciseTimeFlag = true;
              //We need to display wich exercise the use must perform, during this period, on the screen
              _isThereselectExercise = true;
            });
          }
        }
      }
    }
  }//_updateExercisePeriod()

  /*Monitors when the audio finish playing and avoids any possible error message on the console
  * @value: An AudioPlayerState() object to extract its state
  */
  static void monitorNotificationStateHandler(AudioPlayerState value) {
    print("state => $value");
  }//monitorNotificationStateHandler()

  /*
  * Plays the mp3 file that we passed it as parameter
  * @selectedSongPath: The selected mp3 file path on the project folder
  */
  Future playSelectedMusic(String selectedSongPath) async {
    _advancedPlayer = await AudioCache().loop(selectedSongPath);

    //We need to add this to avoid logging any errors when the music finish playing
    if(Platform.isIOS) {
      _advancedPlayer.monitorNotificationStateChanges(monitorNotificationStateHandler);
    }
  }//playSelectedMusic()

  /*
  * Pauses the music that is currently being played
  */
  Future pauseMusicPlaying() async {
    await _advancedPlayer.pause();
  }

  /*
  * Stops completely the music that is currently being played
  */ 
  Future stopMusicPlaying() async {
    await _advancedPlayer.stop();
  }

  /*
  * Restarts the music that has been paused
  */
  Future resumeMusicPlaying() async {
    await _advancedPlayer.resume();
  }

  @override
  void dispose() {
    _advancedPlayer = null;
    super.dispose();
  }

  /*
  * Stops the exercise, stoping the music and replacing the current screen with the congratulations screen
  */
  void finishExercise() {
    stopMusicPlaying();
    Navigator.pushReplacementNamed(context, "/congratulations");
  }
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //We get the arguments that we passed to the named route
    _exerciseRoutineArgs = ModalRoute.of(context).settings.arguments as Map<String, ExerciseRoutine>;
    //We get the list of selected exercises cards
    List<Widget> exercisesListWidgets = _getSelectedExercisesCards(screenHeight, screenWidth, _exerciseRoutineArgs["exerciseRoutine"].selectedExercisesIndexs, _exerciseIndexCounter, _isThereselectExercise);
    //We set the number of set that the user must perform during the exercise
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
                                pauseMusicPlaying();
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
                                    resumeMusicPlaying();
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
                stopMusicPlaying();
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
