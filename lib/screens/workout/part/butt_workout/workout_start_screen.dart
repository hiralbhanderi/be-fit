import 'dart:developer';

import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/exercise_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class WorkoutStartScreen extends StatelessWidget {
  static const routeName = '/WorkoutStartScreen';
  final WorkoutController workoutController = Get.find();
  ButtWorkoutController buttWorkoutController = Get.find();
  // PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  WorkoutAllDataModel modelData = WorkoutAllDataModel();
  final String? dayCountForWorkoutStart;

  WorkoutStartScreen({this.dayCountForWorkoutStart});

  @override
  Widget build(BuildContext context) {
    buttWorkoutController.customTimerController.start();
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
                              Get.offAndToNamed(ButtWorkoutScreen.routeName);
                              // Get.offAllNamed(ButtWorkoutScreen.routeName);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Quit", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
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
            if((buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length??0)-1== index){
              Get.toNamed(CongratulationsScreen.routeName);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                return Get.to(WorkoutCompleteScreen(
                  dayNumber: dayCountForWorkoutStart,
                  exerciseTotalCount: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
                  kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForWorkoutStart!) - 1],
                  duration: buttWorkoutController.timeList[int.parse(dayCountForWorkoutStart!) - 1],
                ));
              });
            }

            buttWorkoutController.customTimerController.start();
            // examStartController.start == 0;
            // buttWorkoutController.isExerciseChangeIndex.value++;
            // pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
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
                      // CupertinoPageScaffold(
                      //   child: TimerCountdown(
                      //     enableDescriptions: false,
                      //     colonsTextStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor),
                      //     timeTextStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor),
                      //     format: CountDownTimerFormat.minutesSeconds,
                      //     endTime: DateTime.now().add(
                      //       Duration(
                      //         minutes: 00,
                      //         seconds: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0,
                      //       ),
                      //     ),
                      //     onEnd: () {
                      //       print("Timer finished");
                      //     },
                      //   ),
                      // ),
                      CustomTimer(
                          controller: buttWorkoutController.customTimerController,
                          begin: Duration(
                              seconds: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0),
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
                                                      style: TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 3.w,
                                                    ),
                                                    Text(
                                                      buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1]
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
                              buttWorkoutController
                                      .buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                  '',
                              style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index+1].workoutAllDataModel?.name ?? ''}',
                              'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ?? ''}',
                              style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // NeonCircularTimer(
                      //   // width: 200,
                      //   width: 100,
                      //
                      //   // strokeWidth: 10,
                      //   duration: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0,
                      //   isReverse: true,
                      //   autoStart: true,
                      //   controller : controller1,
                      //   isTimerTextShown: false,
                      //   neumorphicEffect: false,
                      //   innerFillGradient: LinearGradient(colors: [
                      //     ColorRes.greenColor,
                      //     ColorRes.darkLightGreenColor,
                      //   ]),
                      // ),
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
                                // width: 200,
                                width: 30.w,

                                // strokeWidth: 10,
                                duration: buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0,
                                isReverse: true,
                                autoStart: true,
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
                                  buttWorkoutController.isExerciseChangeIndex.value++;
                                  buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
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
                              // Obx(
                              //   () => buttWorkoutController.isPlayTimer.value
                              //       ? GestureDetector(
                              //           onTap: () {
                              //             buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                              //             buttWorkoutController.customTimerController.start();
                              //             buttWorkoutController.controller1.resume();
                              //           },
                              //           child: Icon(
                              //             Icons.pause,
                              //             size: 10.w,
                              //             color: ColorRes.darkLightGreenColor,
                              //           ))
                              //       : GestureDetector(
                              //           onTap: () {
                              //             buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                              //             buttWorkoutController.customTimerController.pause();
                              //             buttWorkoutController.controller1.pause();
                              //             Get.to(
                              //               TakeBreakScreen(
                              //                 exerciseTotalCount:
                              //                     buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ??
                              //                         0,
                              //                 exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value,
                              //                 exerciseName: buttWorkoutController
                              //                     .buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ??
                              //                     '',
                              //                 exerciseImage: buttWorkoutController
                              //                     .buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.thumbnails ??
                              //                     '',
                              //               ),
                              //             );
                              //           },
                              //           child: Icon(
                              //             Icons.play_arrow,
                              //             size: 10.w,
                              //             color: ColorRes.darkLightGreenColor,
                              //           )),
                              // )
                              ///
                              GestureDetector(
                                  onTap: () {
                                    buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                                    buttWorkoutController.customTimerController.pause();
                                    buttWorkoutController.controller1.pause();
                                    Get.to(
                                      TakeBreakScreen(
                                        exerciseTotalCount:
                                            buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
                                        exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value,
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
                              // Obx(
                              //   () => Row(
                              //     children: [
                              //       buttWorkoutController.isPlayTimer.value
                              //           ? IconButton(
                              //               icon: Icon(
                              //                 Icons.play_arrow,
                              //                 size: 12.w,
                              //                 color: ColorRes.darkLightGreenColor,
                              //               ),
                              //               onPressed: () {
                              //                 buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                              //
                              //                 controller1.resume();
                              //               })
                              //           : IconButton(
                              //               icon: Icon(
                              //                 Icons.pause,
                              //                 size: 12.w,
                              //                 color: ColorRes.darkLightGreenColor,
                              //               ),
                              //               onPressed: () {
                              //                 buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                              //
                              //                 controller1.pause();
                              //               }),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              buttWorkoutController.isExerciseChangeIndex.value++;
                              buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                            },
                            child: buttWorkoutController.isExerciseChangeIndex.value ==
                                    buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?.length
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
            );
          },
        ),
        // body: Column(
        //   children: [
        //     SizedBox(height: 12.w,),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(''),
        //         CupertinoPageScaffold(
        //           child: TimerCountdown(
        //             enableDescriptions: false,
        //             colonsTextStyle: TextStyle(fontSize: 32,fontWeight: FontWeight.w500,color: ColorRes.greenColor),
        //             timeTextStyle: TextStyle(fontSize: 32,fontWeight: FontWeight.w500,color: ColorRes.greenColor),
        //             format: CountDownTimerFormat.minutesSeconds,
        //             endTime: DateTime.now().add(
        //               Duration(
        //                 minutes: 00,
        //                 seconds: 30,
        //               ),
        //             ),
        //             onEnd: () {
        //               print("Timer finished");
        //             },
        //           ),
        //         ),
        //         Icon(Icons.more_vert_sharp,color: ColorRes.greyColor,size: 10.w,)
        //       ],
        //     ),
        //     // Lottie.asset(
        //     //   'assets/LottieLogo1.json',
        //     //   width: 200,
        //     //   height: 200,
        //     //   fit: BoxFit.fill,
        //     // ),
        //     Column(
        //       children: [
        //         Align(
        //             alignment: Alignment.bottomRight,
        //             child: const Icon(Icons.question_mark_outlined,color: ColorRes.greyColor,)),
        //         Text(
        //           'FORWARD FOLD',
        //           style: TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
        //         ),
        //         SizedBox(height: 4.w,),
        //         Text(
        //           'Next: High Kness Skips',
        //           style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
