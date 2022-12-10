import 'dart:developer';
import 'dart:ui';

import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_list_screen.dart';
import 'package:befit/screens/workout/common_screens/warm_up_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_start_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_controller.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_workout_list_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_workout_start_screen.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class PlanBeginnerScreen extends StatelessWidget {
  static const routeName = '/PlanBeginnerScreen';

  PlanBeginnerController planBeginnerController = Get.put(PlanBeginnerController());
  // WorkoutController workoutController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorRes.blackColor.withOpacity(0.1),
      body: Stack(
        children: [
          Image.asset(
            ImagesAsset.backGroundImage,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: ColorRes.greyColor,
                                  size: 8.w,
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                'Plan For Beginner',
                                style: TextStyle(fontSize: 21, color: ColorRes.greyColor, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Text(
                            'Help to Shape Your Perfect Body',
                            style: TextStyle(fontSize: 17, color: ColorRes.greyColor, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                  ],
                ),
                Obx(
                      () => CarouselSlider.builder(
                    carouselController: planBeginnerController.carouselControllerForPlanBeginner,
                    options: CarouselOptions(
                      // height: (boxConstraints.maxHeight / 100) * 82,
                      initialPage: 0,
                      viewportFraction: 0.75,
                      disableCenter: true,
                      height: 95.w,
                      onPageChanged: (int index, CarouselPageChangedReason reason) {
                        // workoutController.selectedIndex.value = index;
                      },
                      enlargeCenterPage: true,
                      reverse: false,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: planBeginnerController.planBeginnerModel.length,
                    itemBuilder: (context, int indexFirst, int indexSecond) {
                      planBeginnerController.getKcalTotalForForPlanBeginner();
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorRes.whiteColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 7.w, bottom: 7.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Day ${planBeginnerController.planBeginnerModel[indexFirst].day}',
                                    style: TextStyle(fontSize: 24, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${planBeginnerController.timeListForPlanBeginner[indexFirst]} min',
                                        style: TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        // '${buttWorkoutController.kcalList[indexFirst]} kcal',
                                        '${planBeginnerController.totalListOfKcalForPlanBeginner[indexFirst]} kcal',
                                        style: TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Step-by-Step exercise guide to strengthen your muscles of Full Body.',
                                    style: TextStyle(fontSize: 15, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.w, right: 6.w),
                                    child: CommonButton(
                                      height: 40,
                                      buttonColor: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          isDayChangeForPlanBeginnerWorkout >= indexFirst ? ColorRes.purpleColor : ColorRes.lightGreyColor,
                                          isDayChangeForPlanBeginnerWorkout >= indexFirst ? ColorRes.pinkColor : ColorRes.lightGreyColor,
                                        ],
                                      ),
                                      width: double.infinity,
                                      onTap: () {
                                        if (isDayChangeForPlanBeginnerWorkout >= indexFirst) {
                                          Get.toNamed(WarmUpScreen.routeName);
                                          Future.delayed(Duration(seconds: 3)).then((value) {
                                            return Get.to(
                                              PlanBeginnerWorkoutStartScreen(
                                                dayCountForWorkoutStartForPlanBeginner: planBeginnerController.planBeginnerModel[indexFirst].day.toString(),
                                              ),
                                            );
                                          });
                                        }

                                        // Get.to(
                                        //   WorkoutStartScreen(
                                        //     dayCountForWorkoutStart: buttWorkoutController.buttWorkoutModel1[indexFirst].day.toString(),
                                        //   ),
                                        // );
                                        planBeginnerController.isExerciseChangeIndexForPlanBeginner.value = 0;
                                      },
                                      buttonNameColor: ColorRes.whiteColor,
                                      buttonName: isDayChangeForPlanBeginnerWorkout >= indexFirst ? 'Start now' : 'Watch video to start',
                                      buttonNameSize: 17,
                                      buttonNameWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (isDayChangeForPlanBeginnerWorkout >= indexFirst) {
                                        Get.to(PlanBeginnerWorkoutListScreen(
                                          dayCountForPlanBeginner: planBeginnerController.planBeginnerModel[indexFirst].day.toString(),
                                          timeDataForPlanBeginner: planBeginnerController.timeListForPlanBeginner[indexFirst],
                                          // kcalData: buttWorkoutController.kcalList[indexFirst],
                                          kcalDataForPlanBeginner: planBeginnerController.totalListOfKcalForPlanBeginner[indexFirst].toString(),
                                        ));
                                      }
                                    },
                                    child: Text(
                                      'Exercise list',
                                      style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                      // return workoutController.signUpViewsList[indexFirst];
                    },
                  ),
                ),
                Text('')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
