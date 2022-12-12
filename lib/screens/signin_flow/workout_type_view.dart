import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WorkoutTypeView extends StatelessWidget {
  List workoutTypeList = ['Full Body Workout', 'Butt Workout', 'Abs Workout'];
  RxInt selectedWorkoutType = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'Let us know how we\ncan help you',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500, height: 0.4.w),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  'You can always change this later',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: ColorRes.blackColor.withOpacity(0.3), fontWeight: FontWeight.w500, height: 0.4.w),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Obx(() => Column(
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            selectedWorkoutType.value = index;
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 15.w,
                                decoration: BoxDecoration(
                                  color: ColorRes.whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(color: ColorRes.greyColor.withOpacity(0.3), blurRadius: 3),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        workoutTypeList[index],
                                        style: TextStyle(color: ColorRes.blackColor.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 17),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      selectedWorkoutType.value == index
                                          ? Image.asset(
                                              ImagesAsset.trueImage,
                                              height: 6.w,
                                              width: 6.w,
                                            )
                                          : Container(
                                              height: 6.w,
                                              width: 6.w,
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: ColorRes.greyColor.withOpacity(0.4)),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.w,
                              )
                            ],
                          ),
                        );
                      }),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CommonButton(
              height: 50,
              buttonColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  ColorRes.greenColor,
                  ColorRes.greenColor,
                ],
              ),
              width: double.infinity,
              onTap: () {
                selectedIndex.value++;
                pageController.jumpToPage(selectedIndex.value);
              },
              buttonNameColor: ColorRes.whiteColor,
              buttonName: 'NEXT',
              buttonNameSize: 17,
              buttonNameWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6.w,
          )
        ],
      ),
    );
  }
}
