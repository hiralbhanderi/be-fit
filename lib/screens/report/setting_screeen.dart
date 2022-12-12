import 'package:befit/screens/water_goal/water_conut_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/SettingScreen';

  SettingScreen({Key? key}) : super(key: key);
  WaterCountController waterCountController = Get.put(WaterCountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 12.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
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
                Text(
                  'Setting',
                  style: TextStyle(fontSize: 6.5.w, color: ColorRes.blackColor.withOpacity(0.8), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorRes.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: ColorRes.greyColor.withOpacity(0.6), blurRadius: 2)]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    children: [
                                      Container(
                                        // height: 90,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              Text(
                                                'Change Your Intake Goal',
                                                style:
                                                    TextStyle(fontSize: 20, color: ColorRes.blueColor.withOpacity(0.7), fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 9.w,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      //if (waterTotalOfUser.value > 1) {
                                                      //                                               waterTotalOfUser.value--;
                                                      //                                             }
                                                      if (waterCountController.waterDrunkOfUserStore.value > 1) {
                                                        waterCountController.waterDrunkOfUserStore.value--;
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 8.w,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        color: ColorRes.whiteColor,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: ColorRes.blackColor.withOpacity(0.6),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.horizontal_rule,
                                                        color: ColorRes.blackColor.withOpacity(0.6),
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => Row(
                                                      children: [
                                                        Text(
                                                          '${waterCountController.waterDrunkOfUserStore.value.round()} ml',
                                                          // '${waterTotalOfUser.value.round()} ml',
                                                          // weightOfUser.value,
                                                          style:
                                                              const TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      waterCountController.waterDrunkOfUserStore.value++;
                                                      //waterTotalOfUser.value++;
                                                    },
                                                    child: Container(
                                                      height: 8.w,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        color: ColorRes.whiteColor,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: ColorRes.blackColor.withOpacity(0.6),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: ColorRes.blackColor.withOpacity(0.6),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2.w),
                                              Obx(() => SliderTheme(
                                                    data: SliderThemeData(
                                                        trackHeight: 0.7.w, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)),
                                                    child: Slider(
                                                      value: waterCountController.waterDrunkOfUserStore.value,
                                                      //value: waterTotalOfUser.value,
                                                      max: 5000,
                                                      activeColor: ColorRes.blueColor.withOpacity(0.7),
                                                      inactiveColor: ColorRes.greyColor.withOpacity(0.5),
                                                      // divisions: 5,
                                                      label: waterCountController.waterDrunkOfUserStore.value.round().toString(),
                                                      // label: waterTotalOfUser.value.round().toString(),
                                                      onChanged: (double value) {
                                                        // setState(() {
                                                        waterCountController.waterDrunkOfUserStore.value = value;
                                                        //waterTotalOfUser.value = value;
                                                        // });
                                                      },
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 4.w,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: ColorRes.whiteColor,
                                                      ),
                                                      child:
                                                          Text("CANCEL", style: TextStyle(color: ColorRes.blueColor.withOpacity(0.7), fontSize: 15)),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                      child: ElevatedButton(
                                                    onPressed: () async {
                                                      ///
                                                      storeWaterTotalOfUser.value = waterCountController.waterDrunkOfUserStore.value;
                                                      await SharedPreferencesConst.setChangeWaterTotalOfUser(storeWaterTotalOfUser.value);
                                                      waterTotalOfUser.value = storeWaterTotalOfUser.value;
                                                      Navigator.of(context).pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(backgroundColor: ColorRes.blueColor.withOpacity(0.7)),
                                                    child: const Text("SAVE", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                                  ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.w,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: settingView(
                              title: 'WaterGoal',
                              iconImage: ImagesAsset.waterGoalSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorRes.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: ColorRes.greyColor.withOpacity(0.6), blurRadius: 2)]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Share.share('https://play.google.com/store/apps/details?id=be.fit.at.home.befit');
                            },
                            child: settingView(
                              title: 'Share',
                              iconImage: ImagesAsset.shareSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                          const Divider(
                            thickness: 0.8,
                            height: 0,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    // insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    children: [
                                      Container(
                                        // height: 90,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              Text(
                                                'Reset Progress',
                                                style:
                                                    TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.7), fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              Text(
                                                'Click to reset all workout plan.',
                                                style:
                                                    TextStyle(fontSize: 16, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: ColorRes.whiteColor,
                                                      ),
                                                      child: const Text("CANCEL", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                      child: ElevatedButton(
                                                    onPressed: () async {
                                                      // print('no selected');
                                                      // selectedWaterGoal.value = waterChangeValue.value;
                                                      ///
                                                      SharedPreferencesConst.setChangeDayForButtWorkout(0);
                                                      SharedPreferencesConst.setChangeDayForAbsWorkout(0);
                                                      SharedPreferencesConst.setChangeDayForPlanIntermediateWorkout(0);
                                                      SharedPreferencesConst.setChangeDayForPlanBeginnerWorkout(0);
                                                      SharedPreferencesConst.setChangeDayForPlanAdvancedWorkout(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                                                    child: const Text("OK", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                                  ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6.w,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: settingView(
                              title: 'Reset Progress',
                              iconImage: ImagesAsset.resetProgressSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorRes.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: ColorRes.greyColor.withOpacity(0.6), blurRadius: 2)]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'hiralbhanderi1598@gmail.com',
                              );
                              makeSocialMediaRequest(emailLaunchUri.toString());
                            },
                            child: settingView(
                              title: 'Feedback',
                              iconImage: ImagesAsset.feedbackSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                          const Divider(
                            thickness: 0.8,
                            height: 0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: settingView(
                              title: 'Privacy Policy',
                              iconImage: ImagesAsset.privatePolicySetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                          const Divider(
                            thickness: 0.8,
                            height: 0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: settingView(
                              title: 'About us',
                              iconImage: ImagesAsset.aboutUsSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                          const Divider(
                            thickness: 0.8,
                            height: 0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: settingView(
                              title: 'Rate Us',
                              iconImage: ImagesAsset.rateUsSetting,
                              iconColor: ColorRes.greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget settingView({String? title, String? subtitle, String? iconImage, Color? iconColor}) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconImage ?? "",
                  scale: 2.5,
                  color: iconColor,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorRes.blackColor.withOpacity(0.5),
              size: 17,
            )
          ],
        ),
      ),
    );
  }

  Future<void> makeSocialMediaRequest(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //   throw 'Could not launch $url';
    // }
  }
}
