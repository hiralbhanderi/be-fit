import 'dart:developer';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class PlanBeginnerController extends GetxController {
  CarouselController carouselControllerForPlanBeginner = CarouselController();
  final CountDownController controllerForPlanBeginner = CountDownController();
  final CustomTimerController customTimerControllerForPlanBeginner = CustomTimerController();
  PageController pageControllerForPlanBeginner = PageController(viewportFraction: 1, keepPage: true);
  AudioPlayer? playerForPlanBeginner = AudioPlayer();
  RxDouble audioGuideValueForPlanBeginner = 50.0.obs;
  RxDouble bgAudioValueForPlanBeginner = 30.0.obs;
  RxDouble setAudioVolumeForPlanBeginner = 0.5.obs;
  RxBool isBGVoiceOnForPlanBeginner = true.obs;
  List<String> timeListForPlanBeginner = [
    '05:40',
    '06:01',
    '06:05',
    '06:50',
    '05:25',
    '06:05',
    '05:46',
    '06:35',
    '06:30',
    '06:11',
    '05:05',
    '05:40',
    '07:30',
    '05:36',
    '06:24',
    '06:10',
    '05:50',
    '06:00',
    '06:15',
    '05:30',
    '07:05',
    '05:20',
    '06:10',
    '06:10',
    '05:15',
    '05:25',
    '06:30',
    '06:35',
  ];

  RxList<PlanBeginnerModel> planBeginnerModel = <PlanBeginnerModel>[].obs;
  List<Exercise> selectedForPlanBeginner = <Exercise>[];
  RxBool isPlayTimerForPlanBeginner = false.obs;
  RxBool isCountDownAnimationHideForPlanBeginner = true.obs;
  RxInt isExerciseChangeIndexForPlanBeginner = 0.obs;
  List<double> totalListOfKcalForPlanBeginner = [];

  @override
  onInit() {
    getDataFromAssetForPanBeginner();
    super.onInit();
  }

  Future<void> getDataFromAssetForPanBeginner() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/plan_beginner.json');
    planBeginnerModel.value = planBeginnerModelFromJson(response);

    /// exercise list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < planBeginnerModel.length; index++) {
      var exerciseData = planBeginnerModel[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
  }

  getKcalTotalForForPlanBeginner() {
    double totalKcal = 0.0;
    for (var element in planBeginnerModel) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = totalKcal + (secondElement.kcal ?? 0);
      }
      // totalListOfKcal.add(totalKcal);
      totalListOfKcalForPlanBeginner.add(double.parse(totalKcal.round().toString()));
    }
  }
}
