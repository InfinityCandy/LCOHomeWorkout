library constants;

const EXERCISES_LIST = const [
    {
      0: {
        "ExerciseName": "Assisted Press",
        "Duration": "1 Minutes",
        "Asset": "assets/images/AssistedPress.png"
      },
      1: {
        "ExerciseName": "Ball Pushup",
        "Duration": "2 Minutes",
        "Asset": "assets/images/BallPushups.png"
      },
      2: {
        "ExerciseName": "Bench Press",
        "Duration": "1 Minute",
        "Asset": "assets/images/BenchPress.png"
      },
      3: {
        "ExerciseName": "Bicep Curls",
        "Duration": "5 Minutes",
        "Asset": "assets/images/BicepsCurls.png"
      },
      4: {
        "ExerciseName": "Crunches",
        "Duration": "1 Minute",
        "Asset": "assets/images/Crunches.png"
      },
      5: {
        "ExerciseName": "Dumbell Pushup",
        "Duration": "2 Minutes",
        "Asset": "assets/images/DumbellPushups.png"
      },
      6: {
        "ExerciseName": "Incline Bench P.",
        "Duration": "2 Minutes",
        "Asset": "assets/images/InclineBenchPress.png"
      },
      7: {
        "ExerciseName": "One Leg Balance",
        "Duration": "8 Minutes",
        "Asset": "assets/images/OneLegBalance.png"
      },
      8: {
        "ExerciseName": "Sitted Row",
        "Duration": "45 Seconds",
        "Asset": "assets/images/SittedRows.png"
      }
    }
  ];

const EXERCISES_PER_WEEK_DAY = const [
  {
    "Monday": {1, 2, 3, 4, 5},
    "Tuesday": {2, 3, 4, 5, 6},
    "Wednesday": {3, 4, 5, 6, 7},
    "Thursday": {4, 5, 6, 7, 8},
    "Friday": {5, 4, 3, 7, 8},
    "Saturday": {8, 1, 2, 3, 5},
    "Sunday": {5, 6, 7, 8, 1}
  }
];