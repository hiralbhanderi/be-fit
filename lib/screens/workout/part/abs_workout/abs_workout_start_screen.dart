import 'dart:developer';

import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_controller.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/rest_time_for_abs_workout_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/take_break_for_abs_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/rest_time_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class AbsWorkoutStartScreen extends StatelessWidget {
  static const routeName = '/AbsWorkoutStartScreen';
  // final WorkoutController workoutController = Get.find();
  AbsWorkoutController absWorkoutController = Get.find();

  // PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  WorkoutAllDataModel modelDataForAbsWorkOut = WorkoutAllDataModel();
  final String? dayCountForWorkoutStartForAbsWorkout;

  AbsWorkoutStartScreen({this.dayCountForWorkoutStartForAbsWorkout});

  @override
  Widget build(BuildContext context) {
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
                              absWorkoutController.isCountDownAnimationHideForAbsWorkout.value = true;
                              Get.offAndToNamed(AbsWorkoutScreen.routeName);
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
          itemCount: absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: absWorkoutController.pageControllerForAbsWorkout,
          onPageChanged: (int index) {
            absWorkoutController.isExerciseChangeIndexForAbsWorkout.value = index;
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration(seconds: 4)).then((value) {
                absWorkoutController.customTimerControllerForAbsWorkout.start();
                absWorkoutController.controllerForAbsWorkout.start();
                absWorkoutController.isCountDownAnimationHideForAbsWorkout.value = false;
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
                              controller: absWorkoutController.customTimerControllerForAbsWorkout,
                              begin: Duration(
                                  seconds:
                                  absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?[index].time ?? 0),
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
                              absWorkoutController
                                  .absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.filePath ??
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
                                                          absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
                                                              .exercise?[index].workoutAllDataModel?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
                                                              .exercise?[index].workoutAllDataModel?.name ??
                                                              '',
                                                          style: TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 3.w,
                                                        ),
                                                        Text(
                                                          absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
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
                                  absWorkoutController
                                      .absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                Text(
                                  // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index+1].workoutAllDataModel?.name ?? ''}',
                                  'Next: ${absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.name ?? ''}',
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
                                  absWorkoutController.isExerciseChangeIndexForAbsWorkout.value--;
                                  absWorkoutController.pageControllerForAbsWorkout.jumpToPage(absWorkoutController.isExerciseChangeIndexForAbsWorkout.value);
                                },
                                child: absWorkoutController.isExerciseChangeIndexForAbsWorkout.value == 0
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
                                    absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?[index].time ?? 0,
                                    // duration: 10,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: absWorkoutController.controllerForAbsWorkout,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (absWorkoutController.isExerciseChangeIndexForAbsWorkout.value <
                                          ((absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ?? 0) -
                                              1)) {
                                        absWorkoutController.customTimerControllerForAbsWorkout.pause();
                                        absWorkoutController.controllerForAbsWorkout.pause();

                                        Get.to(RestTimeForAbsWorkoutScreen(
                                            exerciseTotalCountForAbsWorkout:
                                            absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForAbsWorkout: absWorkoutController.isExerciseChangeIndexForAbsWorkout.value + 1,
                                            exerciseNameForAbsWorkout: absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
                                                .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImageForAbsWorkout: absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
                                                .exercise?[index].workoutAllDataModel?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(AbsWorkoutCompleteScreen(
                                            dayNumberForAbsWorkout: dayCountForWorkoutStartForAbsWorkout,
                                            exerciseTotalCountForAbsWorkout:
                                            absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ??
                                                0,
                                            kcalCountForAbsWorkout: absWorkoutController.kcalListForAbsWorkout[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1],
                                            durationForAbsWorkout: absWorkoutController.timeListForAbsWorkout[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1],
                                          ));
                                        });
                                      }
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        absWorkoutController.isPlayTimerForAbsWorkout.value = !absWorkoutController.isPlayTimerForAbsWorkout.value;
                                        absWorkoutController.customTimerControllerForAbsWorkout.pause();
                                        absWorkoutController.controllerForAbsWorkout.pause();
                                        Get.to(
                                          TakeBreakForAbsWorkoutScreen(
                                            exerciseTotalCountForAbsWorkout:
                                            absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForAbsWorkout: absWorkoutController.isExerciseChangeIndexForAbsWorkout.value + 1,
                                            exerciseNameForAbsWorkout: absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
                                                .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImageForAbsWorkout: absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1]
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
                                  absWorkoutController.isExerciseChangeIndexForAbsWorkout.value++;
                                  absWorkoutController.pageControllerForAbsWorkout.jumpToPage(absWorkoutController.isExerciseChangeIndexForAbsWorkout.value);

                                  // Future.delayed(Duration(seconds: 4)).then((value) {
                                  absWorkoutController.customTimerControllerForAbsWorkout.pause();
                                  absWorkoutController.controllerForAbsWorkout.pause();
                                  absWorkoutController.isCountDownAnimationHideForAbsWorkout.value = true;
                                  // });
                                },
                                child: absWorkoutController.isExerciseChangeIndexForAbsWorkout.value ==
                                    ((absWorkoutController.absWorkoutModel[int.parse(dayCountForWorkoutStartForAbsWorkout!) - 1].exercise?.length ?? 0) - 1)
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
                    visible: absWorkoutController.isCountDownAnimationHideForAbsWorkout.value,
                    child: Center(
                      child: Lottie.asset(
                        'assets/extra/countdown.json', width: 60.w, height: 60.w, repeat: false,
                        // fit: BoxFit.fill,
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
