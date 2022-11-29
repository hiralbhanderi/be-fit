import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_model.dart';
import 'package:befit/screens/workout/part/butt_workout/workout_start_screen.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExerciseListScreen extends StatelessWidget {
  static const routeName = '/ExerciseListScreen';
  final String? dayCount;
  final String? timeData;
  final String? kcalData;
  ButtWorkoutModel? buttWorkoutModel = ButtWorkoutModel();
  WorkoutController workoutController = Get.find();
  ButtWorkoutController buttWorkoutController = Get.find();

  ExerciseListScreen({this.dayCount, this.timeData, this.kcalData, this.buttWorkoutModel});

  @override
  Widget build(BuildContext context) {
    print('buttWorkoutModel length : ${buttWorkoutModel?.exercise?.length}');
    return Scaffold(
      // backgroundColor:ColorRes.blackColor.withOpacity(0.1),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icon(
                          Icons.arrow_back,
                          color: ColorRes.whiteColor,
                          size: 8.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
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
                          'Day $dayCount',
                          style: TextStyle(fontSize: 20, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$timeData',
                                  style: TextStyle(fontSize: 18, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                ),
                                Text(
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
                                  '$kcalData',
                                  style: TextStyle(fontSize: 18, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
                                ),
                                Text(
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
                  buttWorkoutModel?.exercise?.length ?? 0,
                  (index) {
                    var data = buttWorkoutModel?.exercise?[index].actionId;
                    buttWorkoutController.buttWorkoutModelDataPass = buttWorkoutModel?.exercise ?? [];
                    var modelData = workoutController.workoutAllDataModel.firstWhere((element) => element.id == data);
                    buttWorkoutController.workoutAllDataModelDataPass.add(modelData);
                    print('model data --->>>${modelData.id}');
                    print('workoutAllDataModelDataPass data od--->>>${buttWorkoutController.workoutAllDataModelDataPass.length}');
                    print('buttWorkoutModelDataPass data od--->>>${buttWorkoutController.buttWorkoutModelDataPass.length}');
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
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${modelData.name ?? ' '}',
                                      style: TextStyle(fontSize: 17, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    Text(
                                      '${buttWorkoutModel?.exercise?[index].time} ${modelData.unit ?? ''}',
                                      style: TextStyle(fontSize: 17, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(modelData.thumbnails ?? '')
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
              width: double.infinity,
              onTap: () {
                Get.toNamed(WorkoutStartScreen.routeName);
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
