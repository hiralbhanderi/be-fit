import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInFlowScreen extends StatelessWidget {
  static const routeName = '/SignInFlowScreen';

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
              SizedBox(
                height: 14.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              color: selectedIndex.value >= indexOfIndicator ? ColorRes.greenColor : ColorRes.greyColor,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Text('')
                  ],
                ),
              ),
              SizedBox(
                height: 4.w,
              ),
              Expanded(child: signUpViewsList[index]),
            ],
          );
        },
      ),
    );
  }
}
