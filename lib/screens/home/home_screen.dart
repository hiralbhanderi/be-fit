import 'package:befit/screens/food/food_screen.dart';
import 'package:befit/screens/home/home_controller.dart';
import 'package:befit/screens/report/report_screen.dart';
import 'package:befit/screens/workout/workout_screen.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2.w,
        shape: const CircularNotchedRectangle(), //sh
        child: Obx(
          () => SizedBox(
            height: 18.w,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
                top: 2.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    homeController.iconBottom.length,
                    (index) => GestureDetector(
                          onTap: () {
                            homeController.isSelectedBottom.value = index;
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                homeController.iconBottom[index],
                                height: 7.w,
                                width: 7.w,
                                color: homeController.isSelectedBottom.value == index ? ColorRes.greenColor : Colors.grey,
                              ),
                              SizedBox(
                                height: 1.5.w,
                              ),
                              Text(
                                homeController.iconBottomName[index],
                                style: TextStyle(
                                    fontSize: 3.w,
                                    color: homeController.isSelectedBottom.value == index ? ColorRes.greenColor : Colors.grey,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => homeController.isSelectedBottom.value == 0
          ? WorkoutScreen()
          : homeController.isSelectedBottom.value == 1
              ? FoodScreen()
              : ReportScreen()),
    );
  }
}
