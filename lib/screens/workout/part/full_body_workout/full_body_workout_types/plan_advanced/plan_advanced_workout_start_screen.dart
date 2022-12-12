import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/rest_time_for_plan_advanced_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/take_break_for_plan_advanced_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class PlanAdvancedWorkoutStartScreen extends StatelessWidget {
  static const routeName = '/PlanAdvancedWorkoutStartScreen';
  PlanAdvancedController planAdvancedController = Get.find();

  WorkoutAllDataModel modelData = WorkoutAllDataModel();
  final String? dayCountForWorkoutStartForPlanAdvanced;

  PlanAdvancedWorkoutStartScreen({this.dayCountForWorkoutStartForPlanAdvanced});

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
                              planAdvancedController.isCountDownAnimationHideForPlanAdvanced.value = true;
                              // Get.offAndToNamed(PlanAdvancedScreen.routeName);
                              Get.offNamedUntil(PlanAdvancedScreen.routeName, ModalRoute.withName(FullBodyWorkoutTypeScreen.routeName));
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
          itemCount: planAdvancedController.planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: planAdvancedController.pageControllerForPlanAdvanced,
          onPageChanged: (int index) {
            planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value = index;
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 4)).then((value) {
              planAdvancedController.customTimerControllerForPlanAdvanced.start();
              planAdvancedController.controllerForPlanAdvanced.start();
              planAdvancedController.isCountDownAnimationHideForPlanAdvanced.value = false;
            });
            // });

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
                              controller: planAdvancedController.customTimerControllerForPlanAdvanced,
                              begin: Duration(
                                  seconds: planAdvancedController
                                          .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?[index].time ??
                                      0),
                              // seconds: 10),
                              end: const Duration(),
                              builder: (time) {
                                return Text("${time.minutes}:${time.seconds}",
                                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor));
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
                              planAdvancedController.planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?[index]
                                      .workoutAllDataModel?.filePath ??
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
                                                          planAdvancedController
                                                                  .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                                  .exercise?[index]
                                                                  .workoutAllDataModel
                                                                  ?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          planAdvancedController
                                                                  .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                                  .exercise?[index]
                                                                  .workoutAllDataModel
                                                                  ?.name ??
                                                              '',
                                                          style:
                                                              const TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 3.w,
                                                        ),
                                                        Text(
                                                          planAdvancedController
                                                                  .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                                  .exercise?[index]
                                                                  .workoutAllDataModel
                                                                  ?.introduce ??
                                                              '',
                                                          style: const TextStyle(
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
                                      child: const Icon(
                                        Icons.question_mark_outlined,
                                        color: ColorRes.greyColor,
                                      ),
                                    )),
                                Text(
                                  planAdvancedController.planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?[index]
                                          .workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                ((planAdvancedController
                                                .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length) ??
                                            0) >
                                        index + 1
                                    ? Text(
                                        // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index+1].workoutAllDataModel?.name ?? ''}',
                                        'Next: ${planAdvancedController.planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?[index + 1].workoutAllDataModel?.name ?? ''}',
                                        style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                                      )
                                    : Text(
                                        'After this completed',
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
                                  planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value--;
                                  planAdvancedController.pageControllerForPlanAdvanced
                                      .jumpToPage(planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value);
                                  planAdvancedController.customTimerControllerForPlanAdvanced.pause();
                                  planAdvancedController.controllerForPlanAdvanced.pause();
                                  planAdvancedController.isCountDownAnimationHideForPlanAdvanced.value = true;
                                },
                                child: planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value == 0
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
                                    duration: planAdvancedController
                                            .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?[index].time ??
                                        0,
                                    // duration: 10,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: planAdvancedController.controllerForPlanAdvanced,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value <
                                          ((planAdvancedController
                                                      .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ??
                                                  0) -
                                              1)) {
                                        planAdvancedController.customTimerControllerForPlanAdvanced.pause();
                                        planAdvancedController.controllerForPlanAdvanced.pause();

                                        Get.to(RestTimeForPlanAdvancedScreen(
                                            exerciseTotalCountForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanAdvanced: planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value + 1,
                                            exerciseNameForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                    .exercise?[index]
                                                    .workoutAllDataModel
                                                    ?.name ??
                                                '',
                                            exerciseImageForPlanAdvanced: planAdvancedController
                                                .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                .exercise?[index]
                                                .workoutAllDataModel
                                                ?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(PlanAdvancedCompleteScreen(
                                            dayNumberForPlanAdvanced: dayCountForWorkoutStartForPlanAdvanced,
                                            exerciseTotalCountForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ??
                                                0,
                                            kcalCountForPlanAdvanced: planAdvancedController
                                                .totalListOfKcaForPlanAdvanced[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                .toString(),
                                            durationForPlanAdvanced: planAdvancedController
                                                .timeListForPlanAdvanced[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1],
                                          ));
                                        });
                                      }
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        planAdvancedController.isPlayTimerForPlanAdvanced.value =
                                            !planAdvancedController.isPlayTimerForPlanAdvanced.value;
                                        planAdvancedController.customTimerControllerForPlanAdvanced.pause();
                                        planAdvancedController.controllerForPlanAdvanced.pause();
                                        Get.to(
                                          TakeBreakForPlanAdvancedScreen(
                                            exerciseTotalCountForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanAdvanced: planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value + 1,
                                            exerciseNameForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                    .exercise?[index]
                                                    .workoutAllDataModel
                                                    ?.name ??
                                                '',
                                            exerciseImageForPlanAdvanced: planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1]
                                                    .exercise?[index]
                                                    .workoutAllDataModel
                                                    ?.thumbnails ??
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
                                  planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value++;
                                  planAdvancedController.pageControllerForPlanAdvanced
                                      .jumpToPage(planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value);

                                  // Future.delayed(Duration(seconds: 4)).then((value) {
                                  planAdvancedController.customTimerControllerForPlanAdvanced.pause();
                                  planAdvancedController.controllerForPlanAdvanced.pause();
                                  planAdvancedController.isCountDownAnimationHideForPlanAdvanced.value = true;
                                  // });
                                },
                                child: planAdvancedController.isExerciseChangeIndexForPlanAdvanced.value ==
                                        ((planAdvancedController
                                                    .planAdvancedModel[int.parse(dayCountForWorkoutStartForPlanAdvanced!) - 1].exercise?.length ??
                                                0) -
                                            1)
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
                    visible: planAdvancedController.isCountDownAnimationHideForPlanAdvanced.value,
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
