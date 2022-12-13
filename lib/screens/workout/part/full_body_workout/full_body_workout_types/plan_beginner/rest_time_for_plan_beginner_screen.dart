import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class RestTimeForPlanBeginnerScreen extends StatelessWidget {
  static const routeName = '/RestTimeForPlanBeginnerScreen';

  RestTimeForPlanBeginnerScreen({
    this.exerciseNumberForPlanBeginner,
    this.exerciseTotalCountForPlanBeginner,
    this.exerciseNameForPlanBeginner,
    this.exerciseImageForPlanBeginner,
  });

  final int? exerciseNumberForPlanBeginner;
  final int? exerciseTotalCountForPlanBeginner;
  final String? exerciseNameForPlanBeginner;
  final String? exerciseImageForPlanBeginner;

  PlanBeginnerController planBeginnerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                    const Text(
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
                            textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 35, color: ColorRes.whiteColor),
                            isReverse: true,
                            autoStart: true,
                            textFormat: TextFormat.S,
                            backgroudColor: ColorRes.greenColor,
                            innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                            neonColor: Colors.transparent,
                            outerStrokeColor: ColorRes.greenColor,
                            controller: planBeginnerController.controllerForPlanBeginner,
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
                              planBeginnerController.isExerciseChangeIndexForPlanBeginner.value++;
                              planBeginnerController.pageControllerForPlanBeginner
                                  .jumpToPage(planBeginnerController.isExerciseChangeIndexForPlanBeginner.value);
                              planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = true;
                              planBeginnerController.playerForPlanBeginner!.play();
                              Get.back();
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                // buttWorkoutController.customTimerController.start();
                                // buttWorkoutController.controller1.resume();
                                planBeginnerController.isExerciseChangeIndexForPlanBeginner.value++;
                                planBeginnerController.pageControllerForPlanBeginner
                                    .jumpToPage(planBeginnerController.isExerciseChangeIndexForPlanBeginner.value);
                                planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = true;
                                planBeginnerController.playerForPlanBeginner!.play();
                                Get.back();
                              },
                              child: Container(
                                height: 8.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorRes.whiteColor, width: 0.7), borderRadius: BorderRadius.circular(10)),
                                child: const Center(
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
                        'Next: $exerciseNumberForPlanBeginner/$exerciseTotalCountForPlanBeginner',
                        style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        '$exerciseNameForPlanBeginner',
                        style: const TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Image.asset(
                    '$exerciseImageForPlanBeginner',
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
