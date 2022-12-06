import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_screen.dart';
import 'package:befit/screens/workout/workout_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PlanIntermediateCompleteScreen extends StatelessWidget {
  static const routeName = '/PlanIntermediateCompleteScreen';

  PlanIntermediateCompleteScreen({this.dayNumberForPlanIntermediate, this.exerciseTotalCountForPlanIntermediate, this.kcalCountForPlanIntermediate, this.durationForPlanIntermediate});

  final String? dayNumberForPlanIntermediate;
  final int? exerciseTotalCountForPlanIntermediate;
  final String? kcalCountForPlanIntermediate;
  final String? durationForPlanIntermediate;

  PlanIntermediateController planIntermediateController = Get.find();
  RxBool isSwitchOn = true.obs;
  RxDouble currentSliderValue = 20.0.obs;
  RxDouble selectedWeight = 20.0.obs;
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Day $dayNumberForPlanIntermediate',
                                style: TextStyle(fontSize: 24, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
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
                                    '$exerciseTotalCountForPlanIntermediate',
                                    style: TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
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
                                    '$kcalCountForPlanIntermediate',
                                    style: TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
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
                                    '$durationForPlanIntermediate',
                                    style: TextStyle(fontSize: 17, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
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
                              // thumb color (round icon)
                              activeColor: ColorRes.greenColor,
                              activeTrackColor: ColorRes.greenColor.withOpacity(0.3),
                              inactiveThumbColor: ColorRes.greyColor,
                              inactiveTrackColor: ColorRes.greyColor.withOpacity(0.4),
                              splashRadius: 50.0,
                              // boolean variable value
                              value: isSwitchOn.value,
                              // changes the state of the switch
                              onChanged: (value) {
                                // setState(() {
                                isSwitchOn.value = value;
                                // });
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
                                    '${selectedWeight.value.round()} lbs',
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
                                                              if (currentSliderValue.value > 1) {
                                                                currentSliderValue.value--;
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
                                                                  '${currentSliderValue.value.round()}',
                                                                  style: const TextStyle(
                                                                      fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                                                ),
                                                                Text(
                                                                  ' lbs',
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      color: ColorRes.blackColor.withOpacity(0.5),
                                                                      fontWeight: FontWeight.w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              currentSliderValue.value++;
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
                                                          value: currentSliderValue.value,
                                                          max: 400,
                                                          activeColor: ColorRes.greenColor,
                                                          inactiveColor: ColorRes.greyColor.withOpacity(0.5),
                                                          // divisions: 5,
                                                          label: currentSliderValue.value.round().toString(),
                                                          onChanged: (double value) {
                                                            // setState(() {
                                                            currentSliderValue.value = value;
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
                                                              child: const Text("CANCEL", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: ColorRes.whiteColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 15),
                                                          Expanded(
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  // print('no selected');
                                                                  selectedWeight.value = currentSliderValue.value;
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
                        nextIndexForPlanIntermediateWorkout.value = int.parse(dayNumberForPlanIntermediate ?? '0');
                        await SharedPreferencesConst.setChangeDayForPlanIntermediateWorkout(nextIndexForPlanIntermediateWorkout.value);
                        isDayChangeForPlanIntermediateWorkout.value = nextIndexForPlanIntermediateWorkout.value;
                        // buttWorkoutController.carouselController.jumpToPage(nextIndex.value + 1);
                        // Get.offAndToNamed(ButtWorkoutScreen.routeName);
                        // homeController.isSelectedBottom.value == 0;
                        Get.offNamedUntil(PlanIntermediateScreen.routeName,
                            ModalRoute.withName(FullBodyWorkoutTypeScreen.routeName));

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
