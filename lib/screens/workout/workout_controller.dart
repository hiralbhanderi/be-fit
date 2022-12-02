import 'dart:developer';

import 'package:befit/screens/workout/part/abs_workout/abs_workout_view.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_view.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_view.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkoutController extends GetxController{
  CarouselController carouselController = CarouselController();

  RxInt selectedIndex = 0.obs;
  RxList<Widget> signUpViewsList = [
    FullBodyWorkout(),
    ButtWorkoutView(),
    AbsWorkoutView(),
  ].obs;

  // WorkoutAllDataModel workoutAllDataModelDataPass = WorkoutAllDataModel();
  // RxList<WorkoutAllDataModel> workoutAllDataModelDataPass = <WorkoutAllDataModel>[].obs;
  // List<Exercise> buttWorkoutModelDataPass = <Exercise>[];

  RxList<WorkoutAllDataModel> workoutAllDataModel = <WorkoutAllDataModel>[].obs;

  // @override
  // onInit() {
  //   workoutAllDataJson();
  //   super.onInit();
  // }
  // Future<void> workoutAllDataJson() async {
  //   final response = await rootBundle.loadString('assets/train/action.json');
  //   // final data = await json.decode(response);
  //   workoutAllDataModel.value = workoutAllDataModelFromJson(response);
  //   // languageModelData.shuffle();
  //   log('workoutAllDataModel --->>${workoutAllDataModel.first.name}');
  //   // });
  // }

}