import 'dart:developer';

import 'package:befit/screens/workout/part/abs_workout/abs_workout_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class AbsWorkoutController extends GetxController {
  CarouselController carouselControllerForAbsWorkout = CarouselController();
  final CountDownController controllerForAbsWorkout = CountDownController();
  final CustomTimerController customTimerControllerForAbsWorkout = CustomTimerController();
  PageController pageControllerForAbsWorkout = PageController(viewportFraction: 1, keepPage: true);
  List<String> timeListForAbsWorkout = [
    '06:20',
    '06:40',
    '06:25',
    '06:45',
    '06:30',
    '06:20',
    '07:05',
    '07:20',
    '07:55',
    '07:20',
    '07:35',
    '07:55',
    '07:35',
    '07:55',
    '09:20',
    '08:55',
    '09:05',
    '09:00',
    '09:50',
    '09:00',
    '08:55',
    '10:55',
    '10:35',
    '11:11',
    '11:25',
    '11:10',
    '10:50',
    '11:20',
  ];

  List<String> kcalListForAbsWorkout = [
    '41',
    '44',
    '47',
    '39',
    '45',
    '44',
    '44',
    '50',
    '49',
    '50',
    '52',
    '53',
    '55',
    '53',
    '64',
    '59',
    '64',
    '62',
    '65',
    '62',
    '65',
    '77',
    '72',
    '81',
    '85',
    '78',
    '85',
    '80',
  ];

  RxList<AbsWorkoutModel> absWorkoutModel = <AbsWorkoutModel>[].obs;
  List<Exercise> selectedAbsWorkoutModel = <Exercise>[];
  RxBool isPlayTimerForAbsWorkout = false.obs;
  RxBool isCountDownAnimationHideForAbsWorkout = true.obs;
  RxInt isExerciseChangeIndexForAbsWorkout = 0.obs;
  List<double> totalListOfKcalForAbsWorkout = [];

  @override
  onInit() {
    getDataFromAsset();
    super.onInit();
  }

  Future<void> getDataFromAsset() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/abs_workout.json');
    absWorkoutModel.value = absWorkoutModelFromJson(response);

    /// exercise list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < absWorkoutModel.length; index++) {
      var exerciseData = absWorkoutModel[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
    log('absWorkoutModel First Data : actionId: ${absWorkoutModel.first.exercise?.first.time} \n workout: ${absWorkoutModel.first.exercise?.first.workoutAllDataModel?.toJson()}');
  }

  getKcalTotalForAbsWorkout(){
    double totalKcal = 0.0;
    for (var element in absWorkoutModel) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = totalKcal + (secondElement.kcal ?? 0);
      }
      totalListOfKcalForAbsWorkout.add(totalKcal);
    }
  }
}
