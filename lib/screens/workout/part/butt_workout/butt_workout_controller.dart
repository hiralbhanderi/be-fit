import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class ButtWorkoutController extends GetxController {
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

  RxList<ButtWorkoutModel> buttWorkoutModel1 = <ButtWorkoutModel>[].obs;
  List<Exercise> selectedButtWorkoutModel = <Exercise>[];
  RxBool isPlayTimer = false.obs;
  RxBool isCountDownAnimationHide = true.obs;
  RxInt isExerciseChangeIndex = 0.obs;
  List<double> totalListOfKcal = [];

  @override
  onInit() {
    getDataFromAssetForButtWorkout();
    super.onInit();
  }

  Future<void> getDataFromAssetForButtWorkout() async {
    /// day time
    final response = await rootBundle.loadString('assets/train/butt_workout.json');
    buttWorkoutModel1.value = buttWorkoutModelFromJson(response);

    /// exercise list
    final response1 = await rootBundle.loadString('assets/train/action.json');
    List<WorkoutAllDataModel> workoutAllDataModel = workoutAllDataModelFromJson(response1);

    for (int index = 0; index < buttWorkoutModel1.length; index++) {
      var exerciseData = buttWorkoutModel1[index].exercise;
      for (int j = 0; j < (exerciseData?.length ?? 0); j++) {
        var xyz = workoutAllDataModel.firstWhere((element2) => element2.id == exerciseData?[j].actionId);
        exerciseData?[j].workoutAllDataModel = xyz;
      }
    }
  }

  getKcalTotalForButtWorkout() {
    double totalKcal = 0.0;
    for (var element in buttWorkoutModel1) {
      totalKcal = 0;
      for (Exercise secondElement in element.exercise ?? []) {
        totalKcal = totalKcal + (secondElement.kcal ?? 0);
      }
      // totalListOfKcal.add(totalKcal);
      totalListOfKcal.add(double.parse(totalKcal.round().toString()));
    }
  }
}
