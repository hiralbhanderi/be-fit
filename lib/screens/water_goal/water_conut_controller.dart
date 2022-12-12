import 'package:befit/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WaterCountController extends GetxController{

  ///
  RxDouble storeWaterDrunkOfUser = 0.0.obs;
  RxDouble waterDrunkOfUser = 0.0.obs;
  RxDouble waterDrunkOfUserStore = 0.0.obs;
  ///
  RxList<int> waterMlList = [100,200,300,400,500].obs;
  RxInt isSelectedWater  = 0.obs;
  RxDouble waterChangeValue = 2300.0.obs;
  RxDouble currentTotal = 0.0.obs;
  RxInt achieveGoalDays = 0.obs;

  @override
  void onInit() {
    waterDrunkOfUserStore.value = waterTotalOfUser.value;
    super.onInit();
  }

  /// for hive data

  RxList items = [].obs;
  final shoppingBox = Hive.box('water_goal');

  void refreshItems() {
    final data = shoppingBox.keys.map((key) {
      final value = shoppingBox.get(key);
      return {
        "key": key,
        "time": value["time"],
        "mlCount": value["mlCount"],
      };
    }).toList();

    items.value = data.reversed.toList();
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await shoppingBox.add(newItem);
    refreshItems(); // update the UI
  }

  Future<void> deleteItem(int itemKey) async {
    await shoppingBox.delete(itemKey);
    refreshItems();

    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text('An item has been deleted')));
  }
}