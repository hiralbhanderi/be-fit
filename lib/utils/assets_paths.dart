import 'package:get/get.dart';

class ImagesAsset {
  static const String images = 'assets/images';
  static const String workoutImage = '$images/workout_image.png';
  static const String foodImage = '$images/food_image.png';
  static const String reportImage = '$images/report_image.png';
  static const String buttBackgroundImage = '$images/butt_background_image.png';
  static const String trueImage = '$images/true_image.png';
  static const String backGroundImage = '$images/back_ground_image.jpeg';
}

RxInt nextIndex = 0.obs;
RxInt isDayChange = 1.obs;
