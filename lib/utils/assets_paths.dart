import 'package:get/get.dart';

class ImagesAsset {
  static const String images = 'assets/images';
  static const String workoutImage = '$images/workout_image.png';
  static const String foodImage = '$images/food_image.png';
  static const String reportImage = '$images/report_image.png';
  static const String buttBackgroundImage = '$images/butt_background_image.png';
  static const String trueImage = '$images/true_image.png';
  static const String backGroundImage = '$images/back_ground_image.jpeg';
  static const String fullBodyImage = '$images/full_body.png';
  static const String buttImage = '$images/butt.png';
  static const String absImage = '$images/abs.png';
  static const String stepImage = '$images/steps_image.png';
  static const String heightImage = '$images/height_image.png';
  static const String weightImage = '$images/weight_machine_image.png';
  static const String targetWeightImage = '$images/target_target_weight_image.png';
}

///for butt workout
RxInt nextIndexForButtWorkout = 0.obs;
RxInt isDayChangeForButtWorkout = 1.obs;

/// for abs workout
RxInt nextIndexForAbsWorkout = 0.obs;
RxInt isDayChangeForAbsWorkout = 1.obs;

/// for plan intermediate workout
RxInt nextIndexForPlanIntermediateWorkout = 0.obs;
RxInt isDayChangeForPlanIntermediateWorkout = 1.obs;

/// for plan beginner workout
RxInt nextIndexForPlanBeginnerWorkout = 0.obs;
RxInt isDayChangeForPlanBeginnerWorkout = 1.obs;

/// for plan advanced workout
RxInt nextIndexForPlanAdvancedWorkout = 0.obs;
RxInt isDayChangeForPlanAdvancedWorkout = 1.obs;

/// for height store
RxString storeHeightOfUser = ''.obs;
RxString heightOfUser = ''.obs;

/// for weight store
RxString storeWeightOfUser = ''.obs;
RxString weightOfUser = ''.obs;

/// for target weight store
RxString storeTargetWeightOfUser = ''.obs;
RxString targetWeightOfUser = ''.obs;

// RxBool storeChangeWeightTypesOfUser = false.obs;
// RxBool changeWeightTypesOfUser = false.obs;
