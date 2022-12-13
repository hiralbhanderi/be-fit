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
  static const String waterGlassImage = '$images/icon_water.png';
  static const String waterGoalImage = '$images/water_goal.png';
  static const String aboutUsSetting = '$images/about_us_setting.png';
  static const String feedbackSetting = '$images/feedback_setting.png';
  static const String moreSettingSetting = '$images/moresetting_setting.png';
  static const String privatePolicySetting = '$images/private_policy_setting.png';
  static const String rateUsSetting = '$images/rateus_setting.png';
  static const String resetProgressSetting = '$images/restprogress_setting.png';
  static const String shareSetting = '$images/share_setting.png';
  static const String waterGoalSetting = '$images/water_goal_setting.png';
  static const String dwSuccessImage = '$images/dw_success_image.png';
  static const String editImage = '$images/edit_image.png';
  static const String reportImageForWaterGoal = '$images/report_image_for_water_goal.png';
  static const String iconBgmLittle = '$images/icon_bgm_little.png';
  static const String iconBgmBig = '$images/icon_bgm_big.png';
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

RxBool storeChangeWeightTypesOfUser = false.obs;
RxBool changeWeightTypesOfUser = false.obs;

/// for total water
RxDouble storeWaterTotalOfUser = 0.0.obs;
RxDouble waterTotalOfUser = 0.0.obs;

/// for total water
// RxDouble storeWaterDrunkOfUser = 0.0.obs;
// RxDouble waterDrunkOfUser = 0.0.obs;

/// for Date change
RxString storeTodayDate = ''.obs;
RxString todayDate = ''.obs;

/// for Achieve Goal Day
RxInt storeAchieveGoalDay = 0.obs;
RxInt isAchieveGoalDay = 0.obs;
