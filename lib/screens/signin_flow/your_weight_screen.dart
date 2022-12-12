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

class YourWeightView extends StatelessWidget {
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
                    child: Column(
                      children: [
                        Container(
                          width: 28.w,
                          child: TextFormField(
                            enabled: true,
                            controller: yourWeightController,
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
                            if (yourWeightDataStore != null) {
                              yourWeightController.text = yourWeightDataStore!;
                            }
                          },
                          secondButtonClick: () async {
                            if (yourWeightController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter weight first')));
                            } else {
                              isSelectedWeightKGType.value = true;

                              ///
                              storeChangeWeightTypesOfUser.value = isSelectedWeightKGType.value;
                              await SharedPreferencesConst.setChangeWeightTypesOfUser(storeChangeWeightTypesOfUser.value);
                              changeWeightTypesOfUser.value = storeChangeWeightTypesOfUser.value;

                              ///
                              if (isSelectedWeightKGType.value) {
                                isSelectedWeightLBSType.value = false;
                              }
                              yourWeightDataStore ??= yourWeightController.text;
                              yourWeightController.text = yourWeightDataStore!;
                              String a = yourWeightController.text;
                              yourWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                            }
                          },
                        )
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
                if (yourWeightController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter height')));
                } else {
                  storeWeightOfUser.value = isSelectedWeightKGType.value ? '${yourWeightController.text} kg' : '${yourWeightController.text} lbs';
                  await SharedPreferencesConst.setWeightOfUser(storeWeightOfUser.value);
                  weightOfUser.value = storeWeightOfUser.value;
                  var yourWeightValue = weightOfUser.value.split(' ');
                  if (yourWeightValue[1] == 'lbs') {
                    if (int.parse(yourWeightValue[0]) <= 1400) {
                      selectedIndex.value++;
                      pageController.jumpToPage(selectedIndex.value);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter valid height')));
                    }
                  } else if (yourWeightValue[1] == 'kg') {
                    if (int.parse(yourWeightValue[0]) <= 635) {
                      selectedIndex.value++;
                      pageController.jumpToPage(selectedIndex.value);

                      ///
                      isSelectedWeightLBSType.value = true;
                      isSelectedWeightKGType.value = false;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter valid height')));
                    }
                  }
                }
                // storeWeightOfUser.value = isSelectedWeightKGType.value ? '${yourWeightController.text} kg' : '${yourWeightController.text} lbs';
                // await SharedPreferencesConst.setWeightOfUser(storeWeightOfUser.value);
                // weightOfUser.value = storeWeightOfUser.value;

                // ///
                // isSelectedWeightLBSType.value = true;
                // isSelectedWeightKGType.value = false;
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
