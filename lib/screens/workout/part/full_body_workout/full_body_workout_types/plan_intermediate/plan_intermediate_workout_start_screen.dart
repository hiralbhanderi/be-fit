import 'dart:developer';

import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/rest_time_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/rest_time_for_plan_intermediate_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/take_break_for_plan_intermediate_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class PlanIntermediateWorkoutStartScreen extends StatelessWidget {
  static const routeName = '/PlanIntermediateWorkoutStartScreen';
  // final WorkoutController workoutController = Get.find();
  PlanIntermediateController planIntermediateController = Get.find();

  // PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  WorkoutAllDataModel modelDataForPlanIntermediate = WorkoutAllDataModel();
  final String? dayCountForWorkoutStartForPlanIntermediate;

  PlanIntermediateWorkoutStartScreen({this.dayCountForWorkoutStartForPlanIntermediate});

  @override
  Widget build(BuildContext context) {
    // buttWorkoutController.customTimerController.start();
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                // height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Are you sure to quite?",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.back();
                              // Get.back();
                              planIntermediateController.isCountDownAnimationHideForPlanIntermediate.value = true;
                              Get.offAndToNamed(PlanIntermediateScreen.routeName);
                              // Get.offAllNamed(ButtWorkoutScreen.routeName);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorRes.whiteColor,
                            ),
                            child: const Text("Quit", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // print('no selected');
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                              child: const Text("Continue", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );

        return false;
      },
      child: Scaffold(
        body: PageView.builder(
          itemCount: planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: planIntermediateController.pageControllerForPlanIntermediate,
          onPageChanged: (int index) {
            planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value = index;
            // Get.toNamed(CongratulationsScreen.routeName);
            // Future.delayed(const Duration(seconds: 3)).then((value) {
            //   return Get.to(WorkoutCompleteScreen(
            //     dayNumber: dayCountForWorkoutStart,
            //     exerciseTotalCount: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
            //     kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForWorkoutStart!) - 1],
            //     duration: buttWorkoutController.timeList[int.parse(dayCountForWorkoutStart!) - 1],
            //   ));
            // });
            // }
            //   buttWorkoutController.customTimerController.start();
            // examStartController.start == 0;
            // buttWorkoutController.isExerciseChangeIndex.value++;
            // pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration(seconds: 4)).then((value) {
                planIntermediateController.customTimerControllerForPlanIntermediate.start();
                planIntermediateController.controllerForPlanIntermediate.start();
                planIntermediateController.isCountDownAnimationHideForPlanIntermediate.value = false;
              });
            });

            ///
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(''),
                          CustomTimer(
                              controller: planIntermediateController.customTimerControllerForPlanIntermediate,
                              begin: Duration(
                                  seconds:
                                  planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?[index].time ?? 0),
                              // seconds: 10),
                              end: Duration(),
                              builder: (time) {
                                return Text("${time.minutes}:${time.seconds}",
                                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor));
                              }),
                          Icon(
                            Icons.more_vert_sharp,
                            color: ColorRes.greyColor,
                            size: 10.w,
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 4.w,
                            ),
                            Lottie.asset(
                              planIntermediateController
                                  .planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?[index].workoutAllDataModel?.filePath ??
                                  '',
                              width: 60.w,
                              height: 60.w,
                              // fit: BoxFit.fill,
                            ),
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
                                              contentPadding: EdgeInsets.zero,
                                              children: [
                                                Container(
                                                  // height: 90,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                    child: Column(
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        SizedBox(
                                                          height: 2.w,
                                                        ),
                                                        Align(
                                                            alignment: Alignment.topRight,
                                                            child: GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 8.w,
                                                                  color: ColorRes.blackColor.withOpacity(0.5),
                                                                ))),
                                                        Lottie.asset(
                                                          planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                              .exercise?[index].workoutAllDataModel?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                              .exercise?[index].workoutAllDataModel?.name ??
                                                              '',
                                                          style: TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 3.w,
                                                        ),
                                                        Text(
                                                          planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                              .exercise?[index].workoutAllDataModel?.introduce ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 16, color: ColorRes.blackColor, fontWeight: FontWeight.w400, height: 1.5),
                                                        ),
                                                        const SizedBox(height: 20),
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
                                        Icons.question_mark_outlined,
                                        color: ColorRes.greyColor,
                                      ),
                                    )),
                                Text(
                                  planIntermediateController
                                      .planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index+1].workoutAllDataModel?.name ?? ''}',
                                  'Next: ${planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?[index].workoutAllDataModel?.name ?? ''}',
                                  style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 6.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value--;
                                  planIntermediateController.pageControllerForPlanIntermediate.jumpToPage(planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value);
                                  planIntermediateController.customTimerControllerForPlanIntermediate.pause();
                                  planIntermediateController.controllerForPlanIntermediate.pause();
                                  planIntermediateController.isCountDownAnimationHideForPlanIntermediate.value = true;
                                },
                                child: planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value == 0
                                    ? SizedBox(
                                  width: 10.w,
                                )
                                    : Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 10.w,
                                  color: ColorRes.darkLightGreenColor,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  NeonCircularTimer(
                                    width: 30.w,
                                    // strokeWidth: 10,
                                    duration:
                                    planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?[index].time ?? 0,
                                    // duration: 10,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: planIntermediateController.controllerForPlanIntermediate,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value <
                                          ((planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ?? 0) -
                                              1)) {
                                        // buttWorkoutController.isExerciseChangeIndex.value++;
                                        // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                        planIntermediateController.customTimerControllerForPlanIntermediate.pause();
                                        planIntermediateController.controllerForPlanIntermediate.pause();

                                        Get.to(RestTimeForPlanIntermediateScreen(
                                            exerciseTotalCountForPlanIntermediate:
                                            planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanIntermediate: planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value + 1,
                                            exerciseNameForPlanIntermediate: planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImageForPlanIntermediate: planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                .exercise?[index].workoutAllDataModel?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(PlanIntermediateCompleteScreen(
                                            dayNumberForPlanIntermediate: dayCountForWorkoutStartForPlanIntermediate,
                                            exerciseTotalCountForPlanIntermediate:
                                            planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ??
                                                0,
                                            // kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForWorkoutStart!) - 1],
                                            kcalCountForPlanIntermediate: planIntermediateController.totalListOfKcalForPlanIntermediate[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].toString(),
                                            durationForPlanIntermediate: planIntermediateController.timeListForPlanIntermediate[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1],
                                          ));
                                        });
                                      }
                                      // Get.toNamed(CongratulationsScreen.routeName);
                                      // Future.delayed(const Duration(seconds: 3)).then((value) {
                                      //   return Get.to(WorkoutCompleteScreen(
                                      //     dayNumber: dayCountForWorkoutStart,
                                      //     exerciseTotalCount: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
                                      //     kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForWorkoutStart!) - 1],
                                      //     duration: buttWorkoutController.timeList[int.parse(dayCountForWorkoutStart!) - 1],
                                      //   ));
                                      // });
                                      // buttWorkoutController.isExerciseChangeIndex.value = 0;
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        planIntermediateController.isPlayTimerForPlanIntermediate.value = !planIntermediateController.isPlayTimerForPlanIntermediate.value;
                                        planIntermediateController.customTimerControllerForPlanIntermediate.pause();
                                        planIntermediateController.controllerForPlanIntermediate.pause();
                                        Get.to(
                                          TakeBreakForPlanIntermediateScreen(
                                            exerciseTotalCountForPlanIntermediate:
                                            planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanIntermediate: planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value + 1,
                                            exerciseNameForPlanIntermediate: planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImageForPlanIntermediate: planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1]
                                                .exercise?[index].workoutAllDataModel?.thumbnails ??
                                                '',
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.pause,
                                        size: 10.w,
                                        color: ColorRes.darkLightGreenColor,
                                      )),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value++;
                                  planIntermediateController.pageControllerForPlanIntermediate.jumpToPage(planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value);

                                  // Future.delayed(Duration(seconds: 4)).then((value) {
                                  planIntermediateController.customTimerControllerForPlanIntermediate.pause();
                                  planIntermediateController.controllerForPlanIntermediate.pause();
                                  planIntermediateController.isCountDownAnimationHideForPlanIntermediate.value = true;
                                  // });
                                },
                                child: planIntermediateController.isExerciseChangeIndexForPlanIntermediate.value ==
                                    ((planIntermediateController.planIntermediateModel[int.parse(dayCountForWorkoutStartForPlanIntermediate!) - 1].exercise?.length ?? 0) - 1)
                                    ? SizedBox(
                                  width: 10.w,
                                )
                                    : Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10.w,
                                  color: ColorRes.darkLightGreenColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      )
                    ],
                  ),
                ),
                Obx(
                      () => Visibility(
                    visible: planIntermediateController.isCountDownAnimationHideForPlanIntermediate.value,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Lottie.asset(
                          'assets/extra/countdown.json', width: 60.w, height: 60.w, repeat: false,
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
