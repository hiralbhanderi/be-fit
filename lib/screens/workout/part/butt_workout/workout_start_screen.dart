import 'dart:developer';

import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class WorkoutStartScreen extends StatelessWidget {
  static const routeName = '/WorkoutStartScreen';

  // final WorkoutController workoutController = Get.find();
  ButtWorkoutController buttWorkoutController = Get.find();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    log('buttWorkoutModel pass data--->>>${buttWorkoutController.buttWorkoutModelDataPass.first.time.toString()}');
    return Scaffold(
      body: PageView.builder(
        itemCount: buttWorkoutController.buttWorkoutModelDataPass.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (int index) {
          // workoutController.selectedIndex.value = index;
          // examStartController.start == 0;
          // examStartController.selectedIndex.value++;
          // pageController.jumpToPage(examStartController.selectedIndex.value);
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
                    CupertinoPageScaffold(
                      child: TimerCountdown(
                        enableDescriptions: false,
                        colonsTextStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor),
                        timeTextStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor),
                        format: CountDownTimerFormat.minutesSeconds,
                        endTime: DateTime.now().add(
                          Duration(
                            minutes: 00,
                            seconds: buttWorkoutController.buttWorkoutModelDataPass[index].time??0,
                          ),
                        ),
                        onEnd: () {
                          print("Timer finished");
                        },
                      ),
                    ),
                    Icon(
                      Icons.more_vert_sharp,
                      color: ColorRes.greyColor,
                      size: 10.w,
                    )
                  ],
                ),
                // Lottie.asset(
                //   'assets/LottieLogo1.json',
                //   width: 200,
                //   height: 200,
                //   fit: BoxFit.fill,
                // ),
                Column(
                  children: [
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.question_mark_outlined,
                          color: ColorRes.greyColor,
                        )),
                    Text(
                      '${buttWorkoutController.workoutAllDataModelDataPass[index].name}',
                      style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                      'Next: High Kness Skips',
                      style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
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
    );
  }
}
