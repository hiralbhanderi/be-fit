import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
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

class ButtWorkoutStartScreen extends StatelessWidget {
  static const routeName = '/ButtWorkoutStartScreen';
  final WorkoutController workoutController = Get.find();
  ButtWorkoutController buttWorkoutController = Get.find();

  WorkoutAllDataModel modelData = WorkoutAllDataModel();
  final String? dayCountForWorkoutStart;

  ButtWorkoutStartScreen({this.dayCountForWorkoutStart});

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
                              buttWorkoutController.isCountDownAnimationHide.value = true;
                              // Get.offAndToNamed(ButtWorkoutScreen.routeName);
                              ///
                              Get.offNamedUntil(ButtWorkoutScreen.routeName, ModalRoute.withName(HomeScreen.routeName));

                              ///
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
          itemCount: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: buttWorkoutController.pageController,
          onPageChanged: (int index) {
            buttWorkoutController.isExerciseChangeIndex.value = index;
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 4)).then((value) {
              buttWorkoutController.customTimerController.start();
              buttWorkoutController.controller1.start();
              buttWorkoutController.isCountDownAnimationHide.value = false;
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
                              controller: buttWorkoutController.customTimerController,
                              begin: Duration(
                                  seconds:
                                      buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0),
                              // seconds: 5),
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
                              buttWorkoutController
                                      .buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.filePath ??
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
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.name ??
                                                              '',
                                                          style:
                                                              const TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 3.w,
                                                        ),
                                                        Text(
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.introduce ??
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
                                  buttWorkoutController
                                          .buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                ((buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length) ?? 0) > index + 1
                                    ? Text(
                                        'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index + 1].workoutAllDataModel?.name ?? ''}',
                                        // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ?? ''}',
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
                                  buttWorkoutController.isExerciseChangeIndex.value--;
                                  buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                  buttWorkoutController.customTimerController.pause();
                                  buttWorkoutController.controller1.pause();
                                  buttWorkoutController.isCountDownAnimationHide.value = true;
                                },
                                child: buttWorkoutController.isExerciseChangeIndex.value == 0
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
                                    strokeWidth: 10,
                                    duration:
                                        buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0,
                                    // duration: 5,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: buttWorkoutController.controller1,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (buttWorkoutController.isExerciseChangeIndex.value <
                                          ((buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0) -
                                              1)) {
                                        // buttWorkoutController.isExerciseChangeIndex.value++;
                                        // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                        buttWorkoutController.customTimerController.pause();
                                        buttWorkoutController.controller1.pause();

                                        Get.to(RestTimeForButtWorkoutScreen(
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value + 1,
                                            exerciseName: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                    .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImage: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                .exercise?[index].workoutAllDataModel?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(WorkoutCompleteScreen(
                                            dayNumber: dayCountForWorkoutStart,
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            kcalCount: buttWorkoutController.totalListOfKcal[int.parse(dayCountForWorkoutStart!) - 1].toString(),
                                            duration: buttWorkoutController.timeList[int.parse(dayCountForWorkoutStart!) - 1],
                                          ));
                                        });
                                      }
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                                        buttWorkoutController.customTimerController.pause();
                                        buttWorkoutController.controller1.pause();
                                        Get.to(
                                          TakeBreakForButtWorkoutScreen(
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value + 1,
                                            exerciseName: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
                                                    .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImage: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
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
                                  buttWorkoutController.isExerciseChangeIndex.value++;
                                  buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);

                                  buttWorkoutController.customTimerController.pause();
                                  buttWorkoutController.controller1.pause();
                                  buttWorkoutController.isCountDownAnimationHide.value = true;
                                },
                                child: buttWorkoutController.isExerciseChangeIndex.value ==
                                        ((buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0) - 1)
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
                    visible: buttWorkoutController.isCountDownAnimationHide.value,
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
