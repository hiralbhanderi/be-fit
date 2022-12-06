import 'dart:developer';

import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class PlanBeginnerController extends GetxController {
  // ButtWorkoutModel selectedButtWorkoutModel = ButtWorkoutModel();
  // String selectedDay = '0';
  // List<Exercise> buttWorkoutModelDataPass = <Exercise>[];
  CarouselController carouselControllerForPlanBeginner = CarouselController();
  final CountDownController controllerForPlanBeginner = CountDownController();
  final CustomTimerController customTimerControllerForPlanBeginner = CustomTimerController();
  PageController pageControllerForPlanBeginner = PageController(viewportFraction: 1, keepPage: true);
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

  List<String> kcalListForPlanBeginner = [
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
  RxList<PlanBeginnerModel> planBeginnerModel = <PlanBeginnerModel>[].obs;
  // WorkoutAllDataModel buttWorkoutModelDataPass = WorkoutAllDataModel();
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
    log('buttWorkoutModel1 First Data : actionId: ${planBeginnerModel.first.exercise?.first.time} \n workout: ${planBeginnerModel.first.exercise?.first.workoutAllDataModel?.toJson()}');
    // getKcalTotal();
  }

  getKcalTotalForForPlanBeginner(){
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
