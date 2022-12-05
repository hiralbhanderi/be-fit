import 'package:befit/screens/workout/part/abs_workout/abs_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_complete_screen.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class RestTimeForAbsWorkoutScreen extends StatelessWidget {
  static const routeName = '/RestTimeForAbsWorkoutScreen';

  RestTimeForAbsWorkoutScreen({
    this.exerciseNumberForAbsWorkout,
    this.exerciseTotalCountForAbsWorkout,
    this.exerciseNameForAbsWorkout,
    this.exerciseImageForAbsWorkout,
  });

  final int? exerciseNumberForAbsWorkout;
  final int? exerciseTotalCountForAbsWorkout;
  final String? exerciseNameForAbsWorkout;
  final String? exerciseImageForAbsWorkout;

  AbsWorkoutController absWorkoutController = Get.find();

  // RxInt addTime = 15.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // buttWorkoutController.customTimerController.start();
        // buttWorkoutController.controller1.resume();
        return false;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 70.w,
              color: ColorRes.greenColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   height: 12.w,
                    // ),
                    Text(
                      'Rest Time',
                      style: TextStyle(fontSize: 22, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // GestureDetector(
                          //     onTap: () {
                          //
                          //     },
                          //     child: Container(
                          //       height: 8.w,
                          //       width: 20.w,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(color: ColorRes.whiteColor, width: 0.7), borderRadius: BorderRadius.circular(10)),
                          //       child: Center(
                          //         child: Text(
                          //           '+15',
                          //           style: TextStyle(color: ColorRes.whiteColor, fontSize: 18, fontWeight: FontWeight.w400),
                          //         ),
                          //       ),
                          //     )),
                          NeonCircularTimer(
                            // width: 200,
                            width: 30.w,

                            strokeWidth: 5,
                            duration: 30,
                            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 35, color: ColorRes.whiteColor),
                            isReverse: true,
                            autoStart: true,
                            textFormat: TextFormat.S,
                            backgroudColor: ColorRes.greenColor,
                            innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                            neonColor: Colors.transparent,
                            outerStrokeColor: ColorRes.greenColor,
                            controller: absWorkoutController.controllerForAbsWorkout,
                            isTimerTextShown: true,
                            neumorphicEffect: true,
                            innerFillGradient: const LinearGradient(colors: [
                              ColorRes.whiteColor,
                              ColorRes.whiteColor,
                            ]),
                            onComplete: () {
                              // buttWorkoutController.isExerciseChangeIndex.value++;
                              // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                              // buttWorkoutController.customTimerController.start();
                              // buttWorkoutController.controller1.resume();
                              absWorkoutController.isExerciseChangeIndexForAbsWorkout.value++;
                              absWorkoutController.pageControllerForAbsWorkout.jumpToPage(absWorkoutController.isExerciseChangeIndexForAbsWorkout.value);
                              absWorkoutController.isCountDownAnimationHideForAbsWorkout.value = true;
                              Get.back();
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                // buttWorkoutController.customTimerController.start();
                                // buttWorkoutController.controller1.resume();
                                absWorkoutController.isExerciseChangeIndexForAbsWorkout.value++;
                                absWorkoutController.pageControllerForAbsWorkout.jumpToPage(absWorkoutController.isExerciseChangeIndexForAbsWorkout.value);
                                absWorkoutController.isCountDownAnimationHideForAbsWorkout.value = true;
                                Get.back();
                              },
                              child: Container(
                                height: 8.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorRes.whiteColor, width: 0.7), borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'skip',
                                    style: TextStyle(color: ColorRes.whiteColor, fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Next: $exerciseNumberForAbsWorkout/$exerciseTotalCountForAbsWorkout',
                        style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        '$exerciseNameForAbsWorkout',
                        style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Image.asset(
                    '$exerciseImageForAbsWorkout',
                    scale: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
