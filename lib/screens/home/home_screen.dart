import 'package:befit/screens/home/home_controller.dart';
import 'package:befit/screens/report/report_screen.dart';
import 'package:befit/screens/workout/workout_screen.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Are you sure to quite?",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorRes.whiteColor,
                            ),
                            child: const Text("Quit", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                          child: const Text("Continue", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );

        return false;
      },
      child: Scaffold(
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
            // : homeController.isSelectedBottom.value == 1
            //     ? FoodScreen()
            : ReportScreen()),
      ),
    );
  }
}
