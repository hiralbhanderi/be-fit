import 'package:befit/screens/water_goal/water_count_screen.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  WorkoutController workoutController = Get.put(WorkoutController());

  @override
  void initState() {
    isDayChangeForButtWorkout.value = SharedPreferencesConst.getsChangeDayForButtWorkout();
    isDayChangeForAbsWorkout.value = SharedPreferencesConst.getsChangeDayForAbsWorkout();
    isDayChangeForPlanIntermediateWorkout.value = SharedPreferencesConst.getsChangeDayForPlanIntermediateWorkout();
    isDayChangeForPlanBeginnerWorkout.value = SharedPreferencesConst.getsChangeDayForPlanBeginnerWorkout();
    isDayChangeForPlanAdvancedWorkout.value = SharedPreferencesConst.getsChangeDayForPlanAdvancedWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.w,
        ),
        Padding(
          padding:  EdgeInsets.only(left: 6.w,right: 6.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Be Fit',
                    style: TextStyle(fontSize: 7.w, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                      onTap: (){
                        Get.toNamed(WaterCountScreen.routeName);

                      },
                      child: Image.asset(ImagesAsset.waterGlassImage,scale: 2.5,))
                ],
              ),
              SizedBox(
                height: 3.w,
              ),
              Text(
                'Help to Shape Your Perfect Body',
                style: TextStyle(fontSize: 16, color: ColorRes.blackColor.withOpacity(0.8), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.w,
        ),
        Expanded(
          child: CarouselSlider.builder(
            carouselController: workoutController.carouselController,
            options: CarouselOptions(
              // height: (boxConstraints.maxHeight / 100) * 82,
              initialPage: 0,
              viewportFraction: 0.75,
              disableCenter: true,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                workoutController.selectedIndex.value = index;
              },
              enlargeCenterPage: true,
              reverse: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: workoutController.signUpViewsList.length,
            itemBuilder: (context, int indexFirst, int indexSecond) {
              return workoutController.signUpViewsList[indexFirst];
            },
          ),
        ),
        SizedBox(
          height: 6.w,
        ),
      ],
    );
  }
}
