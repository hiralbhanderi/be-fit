import 'package:befit/screens/workout/part/abs_workout/abs_workout_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AbsWorkoutView extends StatelessWidget {
  const AbsWorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorRes.blackColor.withOpacity(0.7)),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                ImagesAsset.absImage,
                fit: BoxFit.fitHeight,
                height: double.infinity,
              )),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 6.w, bottom: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Abs\nWorkout',
                  style: TextStyle(fontSize: 20, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${isDayChangeForAbsWorkout.value}/28 DAYS',
                      style: const TextStyle(fontSize: 20, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      'Step-by-Step Exercise Guide to Strengthen your Muscles of Fill Body.',
                      style: TextStyle(fontSize: 15, color: ColorRes.whiteColor, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: CommonButton(
                    height: 40,
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
                      Get.toNamed(AbsWorkoutScreen.routeName);
                    },
                    buttonNameColor: ColorRes.whiteColor,
                    buttonName: 'OPEN WORKOUT',
                    buttonNameSize: 16,
                    buttonNameWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
