import 'package:befit/screens/workout/part/abs_workout/abs_workout_controller.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TakeBreakForAbsWorkoutScreen extends StatelessWidget {
  static const routeName = '/TakeBreakForAbsWorkoutScreen';

  TakeBreakForAbsWorkoutScreen({this.exerciseNumberForAbsWorkout, this.exerciseTotalCountForAbsWorkout, this.exerciseNameForAbsWorkout, this.exerciseImageForAbsWorkout});

  final int? exerciseNumberForAbsWorkout;
  final int? exerciseTotalCountForAbsWorkout;
  final String? exerciseNameForAbsWorkout;
  final String? exerciseImageForAbsWorkout;

  AbsWorkoutController absWorkoutController = Get.find();

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
                      'Take a break, continue later',
                      style: TextStyle(fontSize: 22, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap:(){
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
                                            const Text("Are you sure to quite?",style: TextStyle(fontSize: 17),),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Get.back();
                                                      // Get.back();
                                                      // Get.back();
                                                      Get.offAndToNamed(AbsWorkoutScreen.routeName);
                                                      // Get.offAllNamed(ButtWorkoutScreen.routeName);
                                                      Navigator.of(context).pop();
                                                    },

                                                    child: const Text("Quit", style: TextStyle(color: ColorRes.greenColor,fontSize: 15)),
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
                                                      child: const Text("Continue",style: TextStyle(color: ColorRes.whiteColor,fontSize: 15)),
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: ColorRes.blackColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.stop,
                                  size: 12.w,
                                  color: ColorRes.whiteColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Text(
                              'Quit',
                              style: TextStyle(fontSize: 20, color: ColorRes.whiteColor.withOpacity(0.7), fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                absWorkoutController.customTimerControllerForAbsWorkout.start();
                                absWorkoutController.controllerForAbsWorkout.resume();
                                Get.back();
                              },
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: ColorRes.whiteColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 12.w,
                                  color: ColorRes.greenColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Text(
                              'Continue',
                              style: TextStyle(fontSize: 20, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only( left: 4.w, right: 4.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Image.asset('$exerciseImageForAbsWorkout',scale: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
