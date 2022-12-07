import 'package:befit/utils/assets_paths.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt isSelectedBottom = 0.obs;
  List<String> iconBottom = [
    ImagesAsset.workoutImage,
    // ImagesAsset.foodImage,
    ImagesAsset.reportImage,
  ];
  List<String> iconBottomName = [
    'WORKOUT',
    // 'FOOD',
    'REPORT',
  ];
}