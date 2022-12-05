import 'package:befit/screens/signin_flow/signin_flow_controller.dart';
import 'package:befit/screens/signin_flow/workout_type_view.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInFlowScreen extends StatelessWidget {
  static const routeName = '/SignInFlowScreen';
  // PageController pageController = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (int index) {
          selectedIndex.value = index;
        },
        itemBuilder: (BuildContext context, int index) {
          ///
          return Column(
            children: [
              SizedBox(height: 12.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorRes.blackColor,
                    size: 7.w,
                  ),
                  Obx(
                        () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: signUpViewsList.map((url) {
                        int indexOfIndicator = signUpViewsList.indexOf(url);
                        return Container(
                          width: 6.w,
                          height: 0.7.w,
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: selectedIndex.value >= indexOfIndicator ? ColorRes.greenColor : ColorRes.greyColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Text('')
                ],
              ),
              SizedBox(height: 4.w,),
              Expanded(child: signUpViewsList[index]),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal:10.w),
              //   child: CommonButton(
              //     height: 50,
              //     buttonColor: const LinearGradient(
              //       begin: Alignment.topLeft,
              //       end: Alignment.topRight,
              //       colors: [
              //         ColorRes.greenColor,
              //         ColorRes.greenColor,
              //       ],
              //     ),
              //     width: double.infinity,
              //     onTap: () {
              //       selectedIndex.value++;
              //       pageController.jumpToPage(selectedIndex.value);
              //     },
              //     buttonNameColor: ColorRes.whiteColor,
              //     buttonName: 'NEXT',
              //     buttonNameSize: 17,
              //     buttonNameWeight: FontWeight.w600,
              //   ),
              // ),
              // SizedBox(height: 6.w,)
            ],
          );
        },
      ),
    );
  }
}
