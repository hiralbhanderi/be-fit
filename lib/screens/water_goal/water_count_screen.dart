import 'dart:developer';

import 'package:befit/screens/water_goal/water_conut_controller.dart';
import 'package:befit/screens/water_goal/water_goal_list_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class WaterCountScreen extends StatefulWidget {
  static const routeName = '/WaterCountScreen';

  @override
  State<WaterCountScreen> createState() => _WaterCountScreenState();
}

class _WaterCountScreenState extends State<WaterCountScreen> {
  WaterCountController waterCountController = Get.put(WaterCountController());

  @override
  void initState() {
    waterCountController.refreshItems();
    getData();
    super.initState();
  }

  getData() async {
    final currentItem = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(currentItem);

    var data = SharedPreferencesConst.getsChangeDate();
    print('data --->>>$data');
    if (data.isEmpty) {
      await SharedPreferencesConst.setChangeDate(formatted);
    }
    var data1 = SharedPreferencesConst.getsChangeDate();
    final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
    final String formatted1 = formatter1.format(DateTime.parse(data1));
    // print('formatted 01 ===>>>$formatted');
    // print('formatted1 02 ===>>>$formatted1');
    // if (data.isEmpty) {
    //   print('formatted1 03 ===>>>$formatted1');
    //
    // await SharedPreferencesConst.setChangeDate(formatted);
    // }else
    if (formatted1 != formatted) {
      SharedPreferencesConst.setChangeWaterDrunkOfUser(0.0);
      SharedPreferencesConst.setChangeDate(formatted);

      ///
      waterCountController.shoppingBox.clear();
    }
    waterTotalOfUser.value = SharedPreferencesConst.getsChangeWaterTotalOfUser();
    waterDrunkOfUser.value = SharedPreferencesConst.getsChangeWaterDrunkOfUser();
    isAchieveGoalDay.value = SharedPreferencesConst.getsAchieveGoalDay();

    // if(waterDrunkOfUser.value.round()>waterTotalOfUser.value.round()){
    //   print('come in loop');
    //   waterCountController.achieveGoalDays.value++;
    //   print('come in -->>>${waterCountController.achieveGoalDays.value}');
    // }
  }

  // RxDouble waterChangeValue = 2300.0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 12.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorRes.blackColor,
                    size: 9.w,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  'Drink Water',
                  style: TextStyle(fontSize: 21, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Obx(
                    () => Text(
                      // '${waterChangeValue.value.round()}ml',
                      '${waterTotalOfUser.value.round()}ml',
                      style: TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Text(
                    'Today Goal',
                    style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.4), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 1.5,
                color: ColorRes.greyColor.withOpacity(0.5),
              ),
              Column(
                children: [
                  Obx(
                    () => Text(
                      // '${waterCountController.achieveGoalDays.value}',
                      '${isAchieveGoalDay.value}',
                      style: TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Text(
                    'Achieve Goal Days',
                    style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.4), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Obx(
            () => Container(
              height: 55.w,
              width: 55.w,
              child: LiquidCircularProgressIndicator(
                // value: currentTotal.value * 100 / waterChangeValue.value / 100,
                value: waterDrunkOfUser.value * 100 / waterCountController.waterChangeValue.value / 100,
                //currentTotal.value = ketlu pidhu // waterChangeValue.value ketlu pivanu che
                // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(ColorRes.blueColor.withOpacity(0.7)),
                backgroundColor: Colors.white,
                borderColor: ColorRes.blueColor.withOpacity(0.7),
                borderWidth: 0.7.w,
                direction: Axis.vertical,
                center: Text(
                  // '${currentTotal.value.round()}  ml',
                  '${waterDrunkOfUser.value.round()}  ml',
                  style: TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(WaterGoalListScreen(
                    totalWaterGoal: waterTotalOfUser.value.round(),
                    waterDrunkGoal: waterDrunkOfUser.value.round(),
                  ));
                },
                child: Icon(
                  Icons.article,
                  color: ColorRes.blueColor.withOpacity(0.7),
                  size: 9.w,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              GestureDetector(
                onTap: () async {
                  waterCountController.currentTotal.value =
                      waterCountController.currentTotal.value + waterCountController.waterMlList[waterCountController.isSelectedWater.value];

                  waterCountController.createItem({
                    "time": DateTime.now(),
                    "mlCount": waterCountController.waterMlList[waterCountController.isSelectedWater.value],
                  });

                  storeWaterDrunkOfUser.value = waterCountController.currentTotal.value;
                  await SharedPreferencesConst.setChangeWaterDrunkOfUser(storeWaterDrunkOfUser.value);
                  waterDrunkOfUser.value = storeWaterDrunkOfUser.value;

                  if (waterDrunkOfUser.value.round() > waterTotalOfUser.value.round()) {
                    print('come in loop');
                    waterCountController.achieveGoalDays.value++;
                    print('come in -->>>${waterCountController.achieveGoalDays.value}');
                    storeAchieveGoalDay.value = waterCountController.achieveGoalDays.value;
                    await SharedPreferencesConst.setAchieveGoalDays(storeAchieveGoalDay.value);
                    isAchieveGoalDay.value = storeAchieveGoalDay.value;
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      ImagesAsset.waterGoalImage,
                      // color: ColorRes.blueColor.withOpacity(0.7),
                      height: 15.w,
                      // fit: BoxFit.fill,
                    ),
                    Icon(
                      Icons.add,
                      color: ColorRes.whiteColor,
                      size: 8.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          insetPadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          children: [
                            Container(
                              // height: 90,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 6.w,
                                    ),
                                    Text(
                                      'Change Your Intake Goal',
                                      style: TextStyle(fontSize: 20, color: ColorRes.blueColor.withOpacity(0.7), fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 9.w,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (waterCountController.waterChangeValue.value > 1) {
                                              waterCountController.waterChangeValue.value--;
                                            }
                                          },
                                          child: Container(
                                            height: 8.w,
                                            width: 8.w,
                                            decoration: BoxDecoration(
                                              color: ColorRes.whiteColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: ColorRes.blackColor.withOpacity(0.6),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.horizontal_rule,
                                              color: ColorRes.blackColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Row(
                                            children: [
                                              Text(
                                                '${waterCountController.waterChangeValue.value.round()} ml',
                                                // weightOfUser.value,
                                                style: const TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            waterCountController.waterChangeValue.value++;
                                          },
                                          child: Container(
                                            height: 8.w,
                                            width: 8.w,
                                            decoration: BoxDecoration(
                                              color: ColorRes.whiteColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: ColorRes.blackColor.withOpacity(0.6),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: ColorRes.blackColor.withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.w),
                                    Obx(() => SliderTheme(
                                          data: SliderThemeData(trackHeight: 0.7.w, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)),
                                          child: Slider(
                                            value: waterCountController.waterChangeValue.value,
                                            max: 5000,
                                            activeColor: ColorRes.blueColor.withOpacity(0.7),
                                            inactiveColor: ColorRes.greyColor.withOpacity(0.5),
                                            // divisions: 5,
                                            label: waterCountController.waterChangeValue.value.round().toString(),
                                            onChanged: (double value) {
                                              // setState(() {
                                              waterCountController.waterChangeValue.value = value;
                                              // });
                                            },
                                          ),
                                        )),
                                    SizedBox(
                                      height: 4.w,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorRes.whiteColor,
                                            ),
                                            child: Text("CANCEL", style: TextStyle(color: ColorRes.blueColor.withOpacity(0.7), fontSize: 15)),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                            child: ElevatedButton(
                                          onPressed: () async {
                                            // print('no selected');
                                            // selectedWaterGoal.value = waterChangeValue.value;
                                            ///
                                            storeWaterTotalOfUser.value = waterCountController.waterChangeValue.value;
                                            await SharedPreferencesConst.setChangeWaterTotalOfUser(storeWaterTotalOfUser.value);
                                            waterTotalOfUser.value = storeWaterTotalOfUser.value;
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: ColorRes.blueColor.withOpacity(0.7)),
                                          child: const Text("SAVE", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.edit_outlined,
                    color: ColorRes.blueColor.withOpacity(0.7),
                    size: 9.w,
                  ))
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Row(
                children: List.generate(
                    waterCountController.waterMlList.length,
                    (index) => Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              waterCountController.isSelectedWater.value = index;
                            },
                            child: Container(
                              height: 10.w,
                              width: 24.w,
                              child: Center(
                                child: Text(
                                  '${waterCountController.waterMlList[index]}ml',
                                  style: TextStyle(fontSize: 16, color: ColorRes.blackColor.withOpacity(0.7), fontWeight: FontWeight.w400),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorRes.whiteColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: waterCountController.isSelectedWater.value == index
                                        ? ColorRes.blueColor.withOpacity(0.7)
                                        : Colors.transparent,
                                    width: 0.6.w),
                              ),
                            ),
                          ),
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
