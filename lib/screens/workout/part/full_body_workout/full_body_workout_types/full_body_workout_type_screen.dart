import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_view.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_view.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_view.dart';
import 'package:befit/utils/color_res.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FullBodyWorkoutTypeScreen extends StatelessWidget {
  static const routeName = '/FullBodyWorkoutTypeScreen';

  FullBodyWorkoutTypeScreen({Key? key}) : super(key: key);

  CarouselController carouselController = CarouselController();

  RxInt selectedIndex = 0.obs;
  RxList<Widget> signUpViewsList = [
    PlanBeginnerView(),
    PlanIntermediateView(),
    PlanAdvancedView(),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 8.w,
                    color: ColorRes.blackColor,
                  )),
              SizedBox(
                width: 6.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Body Workout',
                    style: TextStyle(fontSize: 7.w, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
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
            ],
          ),
        ),
        SizedBox(
          height: 8.w,
        ),
        Expanded(
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
              // height: (boxConstraints.maxHeight / 100) * 82,
              initialPage: 0,
              viewportFraction: 0.75,
              disableCenter: true,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                selectedIndex.value = index;
              },
              enlargeCenterPage: true,
              reverse: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: signUpViewsList.length,
            itemBuilder: (context, int indexFirst, int indexSecond) {
              return signUpViewsList[indexFirst];
            },
          ),
        ),
        SizedBox(
          height: 6.w,
        ),
      ],
    ));
  }
}
