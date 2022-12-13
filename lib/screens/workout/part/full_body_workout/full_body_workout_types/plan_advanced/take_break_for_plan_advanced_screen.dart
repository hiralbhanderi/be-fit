import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_screen.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TakeBreakForPlanAdvancedScreen extends StatelessWidget {
  static const routeName = '/TakeBreakForPlanAdvancedScreen';

  TakeBreakForPlanAdvancedScreen(
      {this.exerciseNumberForPlanAdvanced,
      this.exerciseTotalCountForPlanAdvanced,
      this.exerciseNameForPlanAdvanced,
      this.exerciseImageForPlanAdvanced});

  final int? exerciseNumberForPlanAdvanced;
  final int? exerciseTotalCountForPlanAdvanced;
  final String? exerciseNameForPlanAdvanced;
  final String? exerciseImageForPlanAdvanced;

  PlanAdvancedController planAdvancedController = Get.find();

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
                      'Take a break, continue later',
                      style: TextStyle(fontSize: 22, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
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
                                                      // Get.offAndToNamed(PlanAdvancedScreen.routeName);
                                                      Get.offNamedUntil(
                                                          PlanAdvancedScreen.routeName, ModalRoute.withName(FullBodyWorkoutTypeScreen.routeName));
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
                              onTap: () {
                                planAdvancedController.customTimerControllerForPlanAdvanced.start();
                                planAdvancedController.controllerForPlanAdvanced.resume();
                                planAdvancedController.playerForPlanAdvanced!.play();
                                Get.back();
                              },
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: const BoxDecoration(
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
                            const Text(
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
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Next: $exerciseNumberForPlanAdvanced/$exerciseTotalCountForPlanAdvanced',
                        style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        '$exerciseNameForPlanAdvanced',
                        style: const TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Image.asset(
                    '$exerciseImageForPlanAdvanced',
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
