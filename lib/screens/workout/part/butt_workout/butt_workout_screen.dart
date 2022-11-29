import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/exercise_list_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/workout_start_screen.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ButtWorkoutScreen extends StatelessWidget {
  static const routeName = '/ButtWorkoutScreen';

  ButtWorkoutController buttWorkoutController = Get.put(ButtWorkoutController());
  WorkoutController workoutController = Get.find();

  @override
  Widget build(BuildContext context) {
    print('buttWorkoutController.buttWorkoutModel.lengt ====>>>>${buttWorkoutController.buttWorkoutModel.length}');
    return Scaffold(
      backgroundColor: ColorRes.blackColor.withOpacity(0.1),
      body: Column(
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
                        Icon(
                          Icons.arrow_back,
                          color: ColorRes.greyColor,
                          size: 8.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          'Butt Workout',
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
              carouselController: buttWorkoutController.carouselController,
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
              itemCount: buttWorkoutController.buttWorkoutModel.length,
              itemBuilder: (context, int indexFirst, int indexSecond) {
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
                              'Day ${buttWorkoutController.buttWorkoutModel[indexFirst].day}',
                              style: TextStyle(fontSize: 24, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${buttWorkoutController.timeList[indexFirst]} min',
                                  style: TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '${buttWorkoutController.kcalList[indexFirst]} kcal',
                                  style: TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Step-by-Step Exercise Guide to Shape the Perfect Butt.',
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
                                width: double.infinity,
                                onTap: () {
                                  //
                                  // for (var element in buttWorkoutController.buttWorkoutModel) {
                                  //   for (var element1 in element.exercise!){
                                  //     print('second list --->>>${element1.actionId}');
                                  //   }
                                  // }
                                  // print('id: ${buttWorkoutController.buttWorkoutModel[indexFirst].day.toString()}');
                                  // Get.to(ExerciseListScreen(
                                  //   dayCount: buttWorkoutController.buttWorkoutModel[indexFirst].day.toString(),
                                  //   buttWorkoutModel: buttWorkoutController.buttWorkoutModel[indexFirst],
                                  //   timeData: buttWorkoutController.timeList[indexFirst],
                                  //   kcalData: buttWorkoutController.kcalList[indexFirst],
                                  // ));
                                  var data = buttWorkoutController.buttWorkoutModel[indexFirst].exercise?[indexSecond].actionId;
                                  buttWorkoutController.buttWorkoutModelDataPass = buttWorkoutController.buttWorkoutModel[indexFirst].exercise ?? [];
                                  var modelData = workoutController.workoutAllDataModel.firstWhere((element) => element.id == data);
                                  // workoutController.workoutAllDataModelDataPass = modelData;
                                  print('model data --->>>${modelData.id}');
                                  // print('workoutAllDataModelDataPass data od fff--->>>${workoutController.workoutAllDataModelDataPass.id}');
                                  print('buttWorkoutModelDataPass data od fff--->>>${buttWorkoutController.buttWorkoutModelDataPass.length}');
                                  Get.toNamed(WorkoutStartScreen.routeName);
                                },
                                buttonNameColor: ColorRes.whiteColor,
                                buttonName: 'Start now',
                                buttonNameSize: 17,
                                buttonNameWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: (){
                                print('id: ${buttWorkoutController.buttWorkoutModel[indexFirst].day.toString()}');
                                Get.to(ExerciseListScreen(
                                  dayCount: buttWorkoutController.buttWorkoutModel[indexFirst].day.toString(),
                                  buttWorkoutModel: buttWorkoutController.buttWorkoutModel[indexFirst],
                                  timeData: buttWorkoutController.timeList[indexFirst],
                                  kcalData: buttWorkoutController.kcalList[indexFirst],
                                ));
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
    );
  }
}
