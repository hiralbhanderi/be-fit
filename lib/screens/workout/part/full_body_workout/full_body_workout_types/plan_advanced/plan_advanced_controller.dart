import 'dart:developer';

import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class PlanAdvancedController extends GetxController {
  // ButtWorkoutModel selectedButtWorkoutModel = ButtWorkoutModel();
  // String selectedDay = '0';
  // List<Exercise> buttWorkoutModelDataPass = <Exercise>[];
  CarouselController carouselControllerForPlanAdvanced = CarouselController();
  final CountDownController controllerForPlanAdvanced = CountDownController();
  final CustomTimerController customTimerControllerForPlanAdvanced = CustomTimerController();
  PageController pageControllerForPlanAdvanced = PageController(viewportFraction: 1, keepPage: true);
  List<String> timeListForPlanAdvanced = [
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

  List<String> kcalListForPlanAdvanced = [
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

  // RxList<ButtWorkoutModel> buttWorkoutModel = <ButtWorkoutModel>[].obs;
  RxList<PlanAdvancedModel> planAdvancedModel = <PlanAdvancedModel>[].obs;
  // WorkoutAllDataModel buttWorkoutModelDataPass = WorkoutAllDataModel();
  List<Exercise> selectedForPlanAdvanced = <Exercise>[];
  RxBool isPlayTimerForPlanAdvanced = false.obs;
  RxBool isCountDownAnimationHideForPlanAdvanced = true.obs;
  RxInt isExerciseChangeIndexForPlanAdvanced = 0.obs;
  List<double> totalListOfKcaForPlanAdvanced = [];

  @override
  onInit() {
    // buttWorkoutJson();
    getDataFromAssetForPlanAdvanced();
    super.onInit();
  }

  // Future<void> buttWorkoutJson() async {
  //   final response = await rootBundle.loadString('assets/train/butt_workout.json');
  //   // final data = await json.decode(response);
  //   buttWorkoutModel.value = buttWorkoutModelFromJson(response);
  //   // languageModelData.shuffle();
  //   log('languageModelData --->>${buttWorkoutModel.length}');
  //   // });
  // }

  Future<void> getDataFromAssetForPlanAdvanced() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/plan_advanced.json');
    planAdvancedModel.value = planAdvancedModelFromJson(response);

    /// exercise list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < planAdvancedModel.length; index++) {
      var exerciseData = planAdvancedModel[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
    log('buttWorkoutModel1 First Data : actionId: ${planAdvancedModel.first.exercise?.first.time} \n workout: ${planAdvancedModel.first.exercise?.first.workoutAllDataModel?.toJson()}');
    // getKcalTotal();
  }

  getKcalTotalForPlanAdvanced(){
    double totalKcal = 0.0;
    for (var element in planAdvancedModel) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = totalKcal + (secondElement.kcal ?? 0);
      }
      // totalListOfKcal.add(totalKcal);
      totalListOfKcaForPlanAdvanced.add(double.parse(totalKcal.round().toString()));
    }
  }
}
