import 'package:befit/screens/signin_flow/signin_flow_controller.dart';
import 'package:befit/screens/signin_flow/signin_flow_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:befit/utils/const.dart';
import 'package:befit/utils/height_cosnt.dart';
import 'package:befit/utils/weight_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class YourWeightView extends StatelessWidget {
  // List workoutTypeList = ['Full Body Workout', 'Butt Workout', 'Abs Workout'];
  // RxInt selectedWorkoutType = 0.obs;
  TextEditingController yourWeightController = TextEditingController();

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
                  'Your Weight data',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500, height: 0.4.w),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  'Fill in the data to generate personalized plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: ColorRes.blackColor.withOpacity(0.3), fontWeight: FontWeight.w500, height: 0.4.w),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Container(
                    height: 150,
                    // width: 200,
                    child: WeightConst(yourWeightController: yourWeightController,))
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
                print('height value ---->>>${yourWeightController.text}');
                if (yourWeightController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter height')));
                } else {
                  // if ((int.parse(heightController.text) < 12 && int.parse(heightController.text) < 11) || ((double.parse(heightController.text).round()) < 395)) {
                  //   selectedIndex.value++;
                  //   pageController.jumpToPage(selectedIndex.value);
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter valid height')));
                  // }
                }
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
