import 'package:befit/screens/water_goal/water_conut_controller.dart';
import 'package:befit/screens/water_goal/water_goal_list_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
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
    if (data.isEmpty) {
      await SharedPreferencesConst.setChangeDate(formatted);
    }
    var data1 = SharedPreferencesConst.getsChangeDate();
    final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
    final String formatted1 = formatter1.format(DateTime.parse(data1));
    if (formatted1 != formatted) {
      SharedPreferencesConst.setChangeWaterDrunkOfUser(0.0);
      SharedPreferencesConst.setChangeDate(formatted);

      ///
      waterCountController.shoppingBox.clear();
    }
    // waterTotalOfUser.value = SharedPreferencesConst.getsChangeWaterTotalOfUser();
    waterCountController.waterDrunkOfUser.value = SharedPreferencesConst.getsChangeWaterDrunkOfUser();
    isAchieveGoalDay.value = SharedPreferencesConst.getsAchieveGoalDay();

    // waterCountController.waterDrunkOfUserStore.value = waterTotalOfUser.value;
  }

  // RxDouble waterChangeValue = 2300.0.obs;
  @override
  Widget build(BuildContext context) {
    print('waterDrunkOfUser value ====>>>${waterCountController.waterDrunkOfUser.value}');
    print('waterChangeValue value ====>>>${waterCountController.waterDrunkOfUserStore.value}');
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
              height: 50.w,
              width: 50.w,
              child: LiquidCircularProgressIndicator(
                // value: currentTotal.value * 100 / waterChangeValue.value / 100,
                value: waterCountController.waterDrunkOfUser.value * 100 / waterCountController.waterDrunkOfUserStore.value / 100,
                // value: waterDrunkOfUser.value * 100 / waterTotalOfUser.value / 100,
                //currentTotal.value = ketlu pidhu // waterChangeValue.value ketlu pivanu che
                valueColor: AlwaysStoppedAnimation(ColorRes.blueColor.withOpacity(0.7)),
                backgroundColor: Colors.white,
                borderColor: ColorRes.blueColor.withOpacity(0.7),
                borderWidth: 0.7.w,
                direction: Axis.vertical,
                center: Text(
                  // '${currentTotal.value.round()}  ml',
                  '${waterCountController.waterDrunkOfUser.value.round()}  ml',
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
                    waterDrunkGoal: waterCountController.waterDrunkOfUser.value.round(),
                  ));
                },
                child: Image.asset(
                  ImagesAsset.reportImageForWaterGoal,
                  color: ColorRes.blueColor.withOpacity(0.7),
                  scale: 2.6,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              GestureDetector(
                onTap: () async {
                  waterCountController.currentTotal.value =
                      waterCountController.currentTotal.value + waterCountController.waterMlList[waterCountController.isSelectedWater.value];

                  /// for hive data
                  waterCountController.createItem({
                    "time": DateTime.now(),
                    "mlCount": waterCountController.waterMlList[waterCountController.isSelectedWater.value],
                  });
                  ///

                  waterCountController.storeWaterDrunkOfUser.value = waterCountController.currentTotal.value;
                  await SharedPreferencesConst.setChangeWaterDrunkOfUser(waterCountController.storeWaterDrunkOfUser.value);
                  waterCountController.waterDrunkOfUser.value = waterCountController.storeWaterDrunkOfUser.value;

                  /// after day change sharePreference clear
                  if (waterCountController.waterDrunkOfUser.value.round() > waterTotalOfUser.value.round()) {
                    waterCountController.achieveGoalDays.value++;
                    storeAchieveGoalDay.value = waterCountController.achieveGoalDays.value;
                    await SharedPreferencesConst.setAchieveGoalDays(storeAchieveGoalDay.value);
                    isAchieveGoalDay.value = storeAchieveGoalDay.value;
                  }
                  ///


                  /// For well done dialog
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  Image.asset(
                                    ImagesAsset.dwSuccessImage,
                                    scale: 3,
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  Text(
                                    'Well done, Stay hydrated!',
                                    style: TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(backgroundColor: ColorRes.blueColor.withOpacity(0.7)),
                                      child: const Text("GOT IT", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                    ),
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
                                            //if (waterTotalOfUser.value > 1) {
                                            //                                               waterTotalOfUser.value--;
                                            //                                             }
                                            if (waterCountController.waterDrunkOfUserStore.value > 1) {
                                              waterCountController.waterDrunkOfUserStore.value--;
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
                                                '${waterCountController.waterDrunkOfUserStore.value.round()} ml',
                                                // '${waterTotalOfUser.value.round()} ml',
                                                // weightOfUser.value,
                                                style: const TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            waterCountController.waterDrunkOfUserStore.value++;
                                            //waterTotalOfUser.value++;
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
                                            value: waterCountController.waterDrunkOfUserStore.value,
                                            //value: waterTotalOfUser.value,
                                            max: 5000,
                                            activeColor: ColorRes.blueColor.withOpacity(0.7),
                                            inactiveColor: ColorRes.greyColor.withOpacity(0.5),
                                            // divisions: 5,
                                            label: waterCountController.waterDrunkOfUserStore.value.round().toString(),
                                            // label: waterTotalOfUser.value.round().toString(),
                                            onChanged: (double value) {
                                              // setState(() {
                                              waterCountController.waterDrunkOfUserStore.value = value;
                                              //waterTotalOfUser.value = value;
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
                                            ///
                                            storeWaterTotalOfUser.value = waterCountController.waterDrunkOfUserStore.value;
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
                  child: Image.asset(
                    ImagesAsset.editImage,
                    color: ColorRes.blueColor.withOpacity(0.7),
                    scale: 2.6,
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
