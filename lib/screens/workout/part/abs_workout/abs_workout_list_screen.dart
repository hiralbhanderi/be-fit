import 'package:befit/screens/workout/part/abs_workout/abs_workout_controller.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_start_screen.dart';
import 'package:befit/screens/workout/common_screens/warm_up_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AbsWorkoutListScreen extends StatelessWidget {
  static const routeName = '/AbsWorkoutListScreen';
  final String? dayCountForAbsWorkout;
  final String? timeDataForAbsWorkout;
  final String? kcalDataForAbsWorkout;

  AbsWorkoutController absWorkoutController = Get.find();

  AbsWorkoutListScreen({this.dayCountForAbsWorkout, this.timeDataForAbsWorkout, this.kcalDataForAbsWorkout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                ImagesAsset.buttBackgroundImage,
                height: 70.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorRes.whiteColor,
                            size: 8.w,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        const Text(
                          'Exercise list',
                          style: TextStyle(fontSize: 21, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Day $dayCountForAbsWorkout',
                          style: const TextStyle(fontSize: 20, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$timeDataForAbsWorkout',
                                  style: const TextStyle(fontSize: 18, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  ' MIN',
                                  style: TextStyle(fontSize: 16, color: ColorRes.whiteColor, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Row(
                              children: [
                                Text(
                                  '$kcalDataForAbsWorkout',
                                  style: const TextStyle(fontSize: 18, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  ' KCAL',
                                  style: TextStyle(fontSize: 16, color: ColorRes.whiteColor, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  absWorkoutController.absWorkoutModel[int.parse(dayCountForAbsWorkout!) - 1].exercise?.length ?? 0,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 3.w, top: 3.w, left: 4.w, right: 4.w),
                      child: Container(
                        height: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorRes.whiteColor,
                          boxShadow: [
                            BoxShadow(color: ColorRes.lightGreyColor.withOpacity(0.6), blurRadius: 3),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      absWorkoutController
                                              .absWorkoutModel[int.parse(dayCountForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                          "",
                                      style: const TextStyle(fontSize: 17, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    Text(
                                      '${absWorkoutController.absWorkoutModel[int.parse(dayCountForAbsWorkout!) - 1].exercise?[index].time} ${absWorkoutController.absWorkoutModel[int.parse(dayCountForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.unit ?? ""}',
                                      style: const TextStyle(fontSize: 17, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(absWorkoutController
                                      .absWorkoutModel[int.parse(dayCountForAbsWorkout!) - 1].exercise?[index].workoutAllDataModel?.thumbnails ??
                                  "")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: CommonButton(
              height: 45,
              buttonColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  ColorRes.purpleColor,
                  ColorRes.pinkColor,
                ],
              ),
              width: double.infinity,
              onTap: () {
                Get.toNamed(WarmUpScreen.routeName);
                Future.delayed(const Duration(seconds: 3)).then((value) {
                  return Get.to(AbsWorkoutStartScreen(
                    dayCountForWorkoutStartForAbsWorkout: dayCountForAbsWorkout,
                  ));
                });

                absWorkoutController.isExerciseChangeIndexForAbsWorkout.value = 0;
              },
              buttonNameColor: ColorRes.whiteColor,
              buttonName: 'Start now',
              buttonNameSize: 17,
              buttonNameWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 3.w,
          ),
        ],
      ),
    );
  }
}
