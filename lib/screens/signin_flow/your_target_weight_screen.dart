import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/common_button.dart';
import 'package:befit/utils/const.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:befit/utils/type_change_view_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class YourTargetWeightView extends StatelessWidget {
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
                  'Your Target Weight data',
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
                    child: Column(
                      children: [
                        Container(
                          width: 28.w,
                          child: TextFormField(
                            enabled: true,
                            controller: yourTargetWeightController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            cursorColor: ColorRes.greenColor,
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: ColorRes.greyColor),
                              ),
                              contentPadding: EdgeInsets.only(top: 5.w),
                              hintText: '132',
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 4.5.w),
                                child: Obx(() => isSelectedWeightKGType.value
                                    ? const Text(
                                        'KG',
                                        style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                      )
                                    : const Text(
                                        'LBS',
                                        style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                      )),
                              ),
                              hintStyle: TextStyle(color: ColorRes.blackColor.withOpacity(0.1)),
                            ),
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        TypeChangeViewButton(
                          firstButtonTitle: 'LBS',
                          secondButtonTitle: 'KG',
                          firstButtonClick: () async {
                            isSelectedWeightLBSType.value = true;
                            if (isSelectedWeightLBSType.value) {
                              isSelectedWeightKGType.value = false;
                            }
                            if (yourTargetWeightDataStore != null) {
                              yourTargetWeightController.text = yourTargetWeightDataStore!;
                            }
                          },
                          secondButtonClick: () async {
                            if (yourTargetWeightController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter target weight first')));
                            } else {
                              isSelectedWeightKGType.value = true;
                              if (isSelectedWeightKGType.value) {
                                isSelectedWeightLBSType.value = false;
                              }
                              if (yourTargetWeightDataStore == null) {
                                yourTargetWeightDataStore = yourTargetWeightController.text;
                              }
                              yourTargetWeightController.text = yourTargetWeightDataStore!;
                              String a = yourTargetWeightController.text;
                              yourTargetWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                            }
                          },
                        ),
                      ],
                    ))
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
              onTap: () async {
                if (yourTargetWeightController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter height')));
                } else {
                  // if ((int.parse(heightController.text) < 12 && int.parse(heightController.text) < 11) || ((double.parse(heightController.text).round()) < 395)) {
                  //   selectedIndex.value++;
                  //   pageController.jumpToPage(selectedIndex.value);
                  Get.toNamed(HomeScreen.routeName);
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter valid height')));
                  // }
                }

                storeTargetWeightOfUser.value =
                    isSelectedWeightKGType.value ? '${yourTargetWeightController.text} kg' : '${yourTargetWeightController.text} lbs';
                await SharedPreferencesConst.setTargetWeightOfUser(storeTargetWeightOfUser.value);
                targetWeightOfUser.value = storeTargetWeightOfUser.value;
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
