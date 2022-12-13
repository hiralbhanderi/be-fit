import 'dart:developer';

import 'package:befit/screens/workout/part/abs_workout/abs_workout_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class AbsWorkoutController extends GetxController {
  CarouselController carouselControllerForAbsWorkout = CarouselController();
  final CountDownController controllerForAbsWorkout = CountDownController();
  final CustomTimerController customTimerControllerForAbsWorkout = CustomTimerController();
  PageController pageControllerForAbsWorkout = PageController(viewportFraction: 1, keepPage: true);
  AudioPlayer? playerForAbsWorkout = AudioPlayer();
  RxDouble audioGuideValueForAbsWorkout = 50.0.obs;
  RxDouble bgAudioValueForAbsWorkout = 30.0.obs;
  RxDouble setAudioVolumeForAbsWorkout = 0.5.obs;
  RxBool isBGVoiceOnForAbsWorkout = true.obs;
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

  RxList<AbsWorkoutModel> absWorkoutModel = <AbsWorkoutModel>[].obs;
  List<Exercise> selectedAbsWorkoutModel = <Exercise>[];
  RxBool isPlayTimerForAbsWorkout = false.obs;
  RxBool isCountDownAnimationHideForAbsWorkout = true.obs;
  RxInt isExerciseChangeIndexForAbsWorkout = 0.obs;
  List<double> totalListOfKcalForAbsWorkout = [];

  @override
  onInit() {
    getDataFromAssetForAbsWorkout();
    super.onInit();
  }

  Future<void> getDataFromAssetForAbsWorkout() async {
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
  }

  getKcalTotalForAbsWorkout() {
    double totalKcal = 0.0;
    for (var element in absWorkoutModel) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = totalKcal + (secondElement.kcal ?? 0);
      }
      // totalListOfKcalForAbsWorkout.add(totalKcal);
      totalListOfKcalForAbsWorkout.add(double.parse(totalKcal.round().toString()));
    }
  }
}
