import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PlanBeginnerCompleteScreen extends StatelessWidget {
  static const routeName = '/PlanBeginnerCompleteScreen';

  PlanBeginnerCompleteScreen(
      {this.dayNumberForPlanBeginner, this.exerciseTotalCountForPlanBeginner, this.kcalCountForPlanBeginner, this.durationForPlanBeginner});

  final String? dayNumberForPlanBeginner;
  final int? exerciseTotalCountForPlanBeginner;
  final String? kcalCountForPlanBeginner;
  final String? durationForPlanBeginner;

  PlanBeginnerController planBeginnerController = Get.find();
  RxBool isSwitchOn = true.obs;
  RxDouble weightChangeValue = double.parse(weightOfUser.value.split(' ').first).obs;
  List goalLIst = ['Too easy', 'Easy', 'Comfortable', 'Hard', 'Very hard'];
  RxInt selectedGoal = 2.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 70.w,
                    color: ColorRes.greenColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Day $dayNumberForPlanBeginner',
                                style: const TextStyle(fontSize: 24, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              const Text(
                                'Completed',
                                style: TextStyle(fontSize: 16, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '$exerciseTotalCountForPlanBeginner',
                                    style: const TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  const Text(
                                    'Exercise',
                                    style: TextStyle(fontSize: 15, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '$kcalCountForPlanBeginner',
                                    style: const TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  const Text(
                                    'kcal',
                                    style: TextStyle(fontSize: 15, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '$durationForPlanBeginner',
                                    style: const TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  const Text(
                                    'Duration',
                                    style: TextStyle(fontSize: 15, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -12.w,
                    child: Container(
                      height: 25.w,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: ColorRes.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: ColorRes.greyColor, blurRadius: 3),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Workout Reminder',
                                  style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '20:30',
                                  style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Switch(
                              activeColor: ColorRes.greenColor,
                              activeTrackColor: ColorRes.greenColor.withOpacity(0.3),
                              inactiveThumbColor: ColorRes.greyColor,
                              inactiveTrackColor: ColorRes.greyColor.withOpacity(0.4),
                              splashRadius: 50.0,
                              value: isSwitchOn.value,
                              onChanged: (value) {
                                isSwitchOn.value = value;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 17.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Container(
                      height: 25.w,
                      // width: 90.w,
                      decoration: BoxDecoration(
                        color: ColorRes.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: ColorRes.greyColor, blurRadius: 3),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Update your data',
                                  style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Current Weight',
                                  style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Text(
                                    '${weightChangeValue.value.round().toString()} ${changeWeightTypesOfUser.value ? 'kg' : 'lbs'}',
                                    style: const TextStyle(fontSize: 17, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
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
                                                      const Text(
                                                        'Change Your Weight',
                                                        style: TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(
                                                        height: 9.w,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (weightChangeValue.value > 1) {
                                                                weightChangeValue.value--;
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
                                                                  '${weightChangeValue.value.round()} ${changeWeightTypesOfUser.value ? 'kg' : 'lbs'}',
                                                                  style: const TextStyle(
                                                                      fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              weightChangeValue.value++;
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
                                                            data: SliderThemeData(
                                                                trackHeight: 0.7.w, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)),
                                                            child: Slider(
                                                              value: weightChangeValue.value,
                                                              max: 400,
                                                              activeColor: ColorRes.greenColor,
                                                              inactiveColor: ColorRes.greyColor.withOpacity(0.5),
                                                              // divisions: 5,
                                                              label: weightChangeValue.value.round().toString(),
                                                              onChanged: (double value) {
                                                                weightChangeValue.value = value;
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
                                                              child: const Text("CANCEL", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 15),
                                                          Expanded(
                                                              child: ElevatedButton(
                                                            onPressed: () async {
                                                              ///
                                                              storeWeightOfUser.value = isSelectedWeightKGType.value
                                                                  ? '${weightChangeValue.value} kg'
                                                                  : '${weightChangeValue.value} lbs';
                                                              await SharedPreferencesConst.setWeightOfUser(storeWeightOfUser.value);
                                                              weightOfUser.value = storeWeightOfUser.value;
                                                              Navigator.of(context).pop();
                                                            },
                                                            style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
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
                                    child: const Icon(
                                      Icons.edit,
                                      color: ColorRes.greenColor,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      // height: 25.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorRes.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: ColorRes.greyColor, blurRadius: 3),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Update your data',
                              style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Obx(() => Wrap(
                                  children: List.generate(5, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        selectedGoal.value = index;
                                      },
                                      child: Wrap(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 4.w),
                                            child: Wrap(
                                              children: [
                                                selectedGoal.value == index
                                                    ? Image.asset(
                                                        ImagesAsset.trueImage,
                                                        height: 5.w,
                                                        width: 5.w,
                                                      )
                                                    : Container(
                                                        height: 5.w,
                                                        width: 5.w,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(width: 2, color: ColorRes.blackColor.withOpacity(0.6))),
                                                      ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  goalLIst[index],
                                                  style: TextStyle(
                                                      color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400, fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 25.w,
                      // width: 90.w,
                      decoration: BoxDecoration(
                        color: ColorRes.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: ColorRes.greyColor, blurRadius: 3),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Update your data',
                                    style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Workout complete, hurry to hybrate! 😀',
                                    style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 7.w,
                              width: 18.w,
                              decoration: BoxDecoration(color: ColorRes.greenColor, borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Text(
                                  'GO',
                                  style: TextStyle(fontSize: 16, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        nextIndexForPlanBeginnerWorkout.value = int.parse(dayNumberForPlanBeginner ?? '0');
                        await SharedPreferencesConst.setChangeDayForPlanBeginnerWorkout(nextIndexForPlanBeginnerWorkout.value);
                        isDayChangeForPlanBeginnerWorkout.value = nextIndexForPlanBeginnerWorkout.value;
                        // buttWorkoutController.carouselController.jumpToPage(nextIndex.value + 1);
                        // Get.offAndToNamed(ButtWorkoutScreen.routeName);
                        // homeController.isSelectedBottom.value == 0;
                        Get.offNamedUntil(PlanBeginnerScreen.routeName, ModalRoute.withName(FullBodyWorkoutTypeScreen.routeName));
                      },
                      child: Container(
                        height: 11.w,
                        // width: 20.w,
                        decoration: BoxDecoration(color: ColorRes.greenColor, borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
