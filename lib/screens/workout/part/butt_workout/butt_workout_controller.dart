import 'dart:developer';

import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ButtWorkoutController extends GetxController {
  CarouselController carouselController = CarouselController();
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
  RxList<WorkoutAllDataModel> workoutAllDataModelDataPass = <WorkoutAllDataModel>[].obs;
  List<Exercise> buttWorkoutModelDataPass = <Exercise>[];

  @override
  onInit() {
    buttWorkoutJson();
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
}
