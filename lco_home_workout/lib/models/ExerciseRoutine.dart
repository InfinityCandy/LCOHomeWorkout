import 'package:flutter/foundation.dart';

class ExerciseRoutine {
  int numberOfSets;
  Set<int> selectedExercisesIndexs;

  ExerciseRoutine({@required this.numberOfSets, @required this.selectedExercisesIndexs});
}