import 'dart:developer';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class PlanIntermediateController extends GetxController {
  CarouselController carouselControllerForPlanIntermediate = CarouselController();
  final CountDownController controllerForPlanIntermediate = CountDownController();
  final CustomTimerController customTimerControllerForPlanIntermediate = CustomTimerController();
  PageController pageControllerForPlanIntermediate = PageController(viewportFraction: 1, keepPage: true);
  List<String> timeListForPlanIntermediate = [
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

  RxList<PlanIntermediateModel> planIntermediateModel = <PlanIntermediateModel>[].obs;
  List<Exercise> selectedPlanIntermediateModel = <Exercise>[];
  RxBool isPlayTimerForPlanIntermediate = false.obs;
  RxBool isCountDownAnimationHideForPlanIntermediate = true.obs;
  RxInt isExerciseChangeIndexForPlanIntermediate = 0.obs;
  List<double> totalListOfKcalForPlanIntermediate = [];

  @override
  onInit() {
    getDataFromAssetForPlanIntermediate();
    super.onInit();
  }

  Future<void> getDataFromAssetForPlanIntermediate() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/plan_intermediate.json');
    planIntermediateModel.value = planIntermediateModelFromJson(response);

    /// exercise list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < planIntermediateModel.length; index++) {
      var exerciseData = planIntermediateModel[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
  }

  getKcalTotalForPlanIntermediate() {
    double totalKcal = 0.0;
    for (var element in planIntermediateModel) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = (totalKcal + (secondElement.kcal ?? 0));
      }
      // totalListOfKcalForPlanIntermediate.add(totalKcal);
      totalListOfKcalForPlanIntermediate.add(double.parse(totalKcal.round().toString()));
    }
  }
}
