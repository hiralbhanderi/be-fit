import 'dart:developer';

import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class ButtWorkoutController extends GetxController {
  // ButtWorkoutModel selectedButtWorkoutModel = ButtWorkoutModel();
  // String selectedDay = '0';
  // List<Exercise> buttWorkoutModelDataPass = <Exercise>[];
  CarouselController carouselController = CarouselController();
  final CountDownController controller1 = CountDownController();
  final CustomTimerController customTimerController = CustomTimerController();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  List<String> timeList = [
    '07:15',
    '05:55',
    '06:40',
    '07:00',
    '06:15',
    '06:20',
    '06:50',
    '07:15',
    '07:25',
    '07:55',
    '07:40',
    '07:50',
    '07:15',
    '07:40',
    '09:20',
    '08:45',
    '08:55',
    '09:15',
    '08:00',
    '09:28',
    '09:20',
    '11:08',
    '11:18',
    '11:50',
    '12:08',
    '12:55',
    '12:03',
    '12:08',
  ];

  List<String> kcalList = [
    '41',
    '38',
    '34',
    '39',
    '35',
    '37',
    '42',
    '42',
    '44',
    '43',
    '45',
    '43',
    '42',
    '47',
    '56',
    '53',
    '51',
    '57',
    '46',
    '55',
    '53',
    '69',
    '72',
    '85',
    '76',
    '81',
    '87',
    '78',
  ];

  RxList<ButtWorkoutModel> buttWorkoutModel = <ButtWorkoutModel>[].obs;
  RxList<ButtWorkoutModel> buttWorkoutModel1 = <ButtWorkoutModel>[].obs;
  // WorkoutAllDataModel buttWorkoutModelDataPass = WorkoutAllDataModel();
  List<Exercise> selectedButtWorkoutModel = <Exercise>[];
  RxBool isPlayTimer = false.obs;
  RxInt isExerciseChangeIndex = 0.obs;

  @override
  onInit() {
    buttWorkoutJson();
    getDataFromAsset();
    super.onInit();
  }

  Future<void> buttWorkoutJson() async {
    final response = await rootBundle.loadString('assets/train/butt_workout.json');
    // final data = await json.decode(response);
    buttWorkoutModel.value = buttWorkoutModelFromJson(response);
    // languageModelData.shuffle();
    log('languageModelData --->>${buttWorkoutModel.length}');
    // });
  }

  Future<void> getDataFromAsset() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/butt_workout.json');
    buttWorkoutModel1.value = buttWorkoutModelFromJson(response);

    /// excesi list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < buttWorkoutModel1.length; index++) {
      var exerciseData = buttWorkoutModel1[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
    log('buttWorkoutModel1 First Data : actionId: ${buttWorkoutModel1.first.exercise?.first.time} \n workout: ${buttWorkoutModel1.first.exercise?.first.workoutAllDataModel?.toJson()}');
  }
}
