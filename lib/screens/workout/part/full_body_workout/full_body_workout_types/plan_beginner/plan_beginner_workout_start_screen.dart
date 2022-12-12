import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/rest_time_for_plan_beginner_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/take_break_for_plan_beginner_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class PlanBeginnerWorkoutStartScreen extends StatelessWidget {
  static const routeName = '/PlanBeginnerWorkoutStartScreen';
  PlanBeginnerController planBeginnerController = Get.find();

  WorkoutAllDataModel modelData = WorkoutAllDataModel();
  final String? dayCountForWorkoutStartForPlanBeginner;

  PlanBeginnerWorkoutStartScreen({this.dayCountForWorkoutStartForPlanBeginner});

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
                              planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = true;
                              // Get.offAndToNamed(PlanBeginnerScreen.routeName);
                              Get.offNamedUntil(PlanBeginnerScreen.routeName, ModalRoute.withName(FullBodyWorkoutTypeScreen.routeName));
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
          itemCount: planBeginnerController.planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: planBeginnerController.pageControllerForPlanBeginner,
          onPageChanged: (int index) {
            planBeginnerController.isExerciseChangeIndexForPlanBeginner.value = index;
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 4)).then((value) {
              planBeginnerController.customTimerControllerForPlanBeginner.start();
              planBeginnerController.controllerForPlanBeginner.start();
              planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = false;
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
                              controller: planBeginnerController.customTimerControllerForPlanBeginner,
                              begin: Duration(
                                  seconds: planBeginnerController
                                          .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?[index].time ??
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
                              planBeginnerController.planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?[index]
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
                                                          planBeginnerController
                                                                  .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
                                                                  .exercise?[index]
                                                                  .workoutAllDataModel
                                                                  ?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          planBeginnerController
                                                                  .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
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
                                                          planBeginnerController
                                                                  .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
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
                                  planBeginnerController.planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?[index]
                                          .workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                ((planBeginnerController
                                                .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length) ??
                                            0) >
                                        index + 1
                                    ? Text(
                                        // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index+1].workoutAllDataModel?.name ?? ''}',
                                        'Next: ${planBeginnerController.planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?[index + 1].workoutAllDataModel?.name ?? ''}',
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
                                  planBeginnerController.isExerciseChangeIndexForPlanBeginner.value--;
                                  planBeginnerController.pageControllerForPlanBeginner
                                      .jumpToPage(planBeginnerController.isExerciseChangeIndexForPlanBeginner.value);
                                  planBeginnerController.customTimerControllerForPlanBeginner.pause();
                                  planBeginnerController.controllerForPlanBeginner.pause();
                                  planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = true;
                                },
                                child: planBeginnerController.isExerciseChangeIndexForPlanBeginner.value == 0
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
                                    duration: planBeginnerController
                                            .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?[index].time ??
                                        0,
                                    // duration: 10,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: planBeginnerController.controllerForPlanBeginner,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (planBeginnerController.isExerciseChangeIndexForPlanBeginner.value <
                                          ((planBeginnerController
                                                      .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ??
                                                  0) -
                                              1)) {
                                        // buttWorkoutController.isExerciseChangeIndex.value++;
                                        // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                        planBeginnerController.customTimerControllerForPlanBeginner.pause();
                                        planBeginnerController.controllerForPlanBeginner.pause();

                                        Get.to(RestTimeForPlanBeginnerScreen(
                                            exerciseTotalCountForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanBeginner: planBeginnerController.isExerciseChangeIndexForPlanBeginner.value + 1,
                                            exerciseNameForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
                                                    .exercise?[index]
                                                    .workoutAllDataModel
                                                    ?.name ??
                                                '',
                                            exerciseImageForPlanBeginner: planBeginnerController
                                                .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
                                                .exercise?[index]
                                                .workoutAllDataModel
                                                ?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(PlanBeginnerCompleteScreen(
                                            dayNumberForPlanBeginner: dayCountForWorkoutStartForPlanBeginner,
                                            exerciseTotalCountForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ??
                                                0,
                                            // kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForWorkoutStart!) - 1],
                                            kcalCountForPlanBeginner: planBeginnerController
                                                .totalListOfKcalForPlanBeginner[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
                                                .toString(),
                                            durationForPlanBeginner: planBeginnerController
                                                .timeListForPlanBeginner[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1],
                                          ));
                                        });
                                      }
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        planBeginnerController.isPlayTimerForPlanBeginner.value =
                                            !planBeginnerController.isPlayTimerForPlanBeginner.value;
                                        planBeginnerController.customTimerControllerForPlanBeginner.pause();
                                        planBeginnerController.controllerForPlanBeginner.pause();
                                        Get.to(
                                          TakeBreakForPlanBeginnerScreen(
                                            exerciseTotalCountForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ??
                                                0,
                                            exerciseNumberForPlanBeginner: planBeginnerController.isExerciseChangeIndexForPlanBeginner.value + 1,
                                            exerciseNameForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
                                                    .exercise?[index]
                                                    .workoutAllDataModel
                                                    ?.name ??
                                                '',
                                            exerciseImageForPlanBeginner: planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1]
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
                                  planBeginnerController.isExerciseChangeIndexForPlanBeginner.value++;
                                  planBeginnerController.pageControllerForPlanBeginner
                                      .jumpToPage(planBeginnerController.isExerciseChangeIndexForPlanBeginner.value);

                                  // Future.delayed(Duration(seconds: 4)).then((value) {
                                  planBeginnerController.customTimerControllerForPlanBeginner.pause();
                                  planBeginnerController.controllerForPlanBeginner.pause();
                                  planBeginnerController.isCountDownAnimationHideForPlanBeginner.value = true;
                                  // });
                                },
                                child: planBeginnerController.isExerciseChangeIndexForPlanBeginner.value ==
                                        ((planBeginnerController
                                                    .planBeginnerModel[int.parse(dayCountForWorkoutStartForPlanBeginner!) - 1].exercise?.length ??
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
                    visible: planBeginnerController.isCountDownAnimationHideForPlanBeginner.value,
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
