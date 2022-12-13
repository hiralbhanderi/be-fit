import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/rest_time_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/workout_all_data_model.dart';
import 'package:befit/screens/workout/workout_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:sizer/sizer.dart';

class ButtWorkoutStartScreen extends StatefulWidget {
  static const routeName = '/ButtWorkoutStartScreen';
  final String? dayCountForWorkoutStart;

  ButtWorkoutStartScreen({this.dayCountForWorkoutStart});

  @override
  State<ButtWorkoutStartScreen> createState() => _ButtWorkoutStartScreenState();
}

class _ButtWorkoutStartScreenState extends State<ButtWorkoutStartScreen> {
  final WorkoutController workoutController = Get.find();

  ButtWorkoutController buttWorkoutController = Get.find();

  WorkoutAllDataModel modelData = WorkoutAllDataModel();

  @override
  void initState() {
    audioStart();
    super.initState();
  }

  audioStart() async {
    if (buttWorkoutController.isBGVoiceOn.value) {
      await buttWorkoutController.player!.setAsset(
        'assets/music_file/fitness_bgm.mp3',
      );
      buttWorkoutController.player!.play();
      buttWorkoutController.player!.setVolume(buttWorkoutController.setAudioVolume.value);
    }else{
      buttWorkoutController.player!.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                // height: 90,
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
                              buttWorkoutController.isCountDownAnimationHide.value = true;
                              // Get.offAndToNamed(ButtWorkoutScreen.routeName);
                              ///
                              Get.offNamedUntil(ButtWorkoutScreen.routeName, ModalRoute.withName(HomeScreen.routeName));

                              ///
                              // Get.offAllNamed(ButtWorkoutScreen.routeName);
                              Navigator.of(context).pop();
                              buttWorkoutController.player!.stop();
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
        body: PageView.builder(
          itemCount: buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: buttWorkoutController.pageController,
          onPageChanged: (int index) {
            buttWorkoutController.isExerciseChangeIndex.value = index;
          },
          itemBuilder: (BuildContext context, int index) {
            ///
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 4)).then((value) {
              buttWorkoutController.customTimerController.start();
              buttWorkoutController.controller1.start();
              buttWorkoutController.isCountDownAnimationHide.value = false;
            });
            // });

            ///
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(''),
                          CustomTimer(
                              controller: buttWorkoutController.customTimerController,
                              begin: Duration(
                                  seconds:
                                      buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0),
                              // seconds: 5),
                              end: const Duration(),
                              builder: (time) {
                                return Text("${time.minutes}:${time.seconds}",
                                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: ColorRes.greenColor));
                              }),
                          GestureDetector(
                            onTap: () async {
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
                                                'Guide Voice',
                                                style:
                                                    TextStyle(fontSize: 18, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(height: 2.w),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    ImagesAsset.iconBgmLittle,
                                                    color: ColorRes.greenColor,
                                                    scale: 3,
                                                  ),
                                                  Expanded(
                                                    child: Obx(
                                                      () => SliderTheme(
                                                        data: SliderThemeData(
                                                            trackHeight: 0.6.w, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5)),
                                                        child: Slider(
                                                          value: buttWorkoutController.audioGuideValue.value,
                                                          //value: waterTotalOfUser.value,
                                                          max: 100,
                                                          activeColor: ColorRes.greenColor.withOpacity(0.7),
                                                          inactiveColor: ColorRes.greenColor.withOpacity(0.2),
                                                          // divisions: 5,
                                                          label: buttWorkoutController.audioGuideValue.value.round().toString(),
                                                          // label: waterTotalOfUser.value.round().toString(),
                                                          onChanged: (double value) {
                                                            // setState(() {
                                                            buttWorkoutController.audioGuideValue.value = value;
                                                            // buttWorkoutController.setAudioVolume.value =
                                                            //     buttWorkoutController.audioGuideValue.value.round() / 100;
                                                            //waterTotalOfUser.value = value;
                                                            // });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    ImagesAsset.iconBgmBig,
                                                    color: ColorRes.greenColor,
                                                    scale: 3,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6.w),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Background Voice',
                                                    style: TextStyle(
                                                        fontSize: 18, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w500),
                                                  ),
                                                  Obx(() => Switch(
                                                        onChanged: (value) {
                                                          buttWorkoutController.isBGVoiceOn.value = value;
                                                        },
                                                        value: buttWorkoutController.isBGVoiceOn.value,
                                                        inactiveThumbColor: ColorRes.whiteColor,
                                                        inactiveTrackColor: ColorRes.blackColor.withOpacity(0.2),
                                                        activeColor: ColorRes.greenColor.withOpacity(0.7),
                                                        activeTrackColor: ColorRes.greenColor.withOpacity(0.2),
                                                        // ...
                                                      ))
                                                ],
                                              ),
                                              SizedBox(height: 2.w),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    ImagesAsset.iconBgmLittle,
                                                    color: ColorRes.greenColor,
                                                    scale: 3,
                                                  ),
                                                  Expanded(
                                                    child: Obx(
                                                      () => SliderTheme(
                                                        data: SliderThemeData(
                                                            trackHeight: 0.6.w, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5)),
                                                        child: Slider(
                                                          value: buttWorkoutController.bgAudioValue.value,
                                                          //value: waterTotalOfUser.value,
                                                          max: 100,
                                                          activeColor: ColorRes.greenColor.withOpacity(0.7),
                                                          inactiveColor: ColorRes.greenColor.withOpacity(0.2),
                                                          // divisions: 5,
                                                          label: buttWorkoutController.bgAudioValue.value.round().toString(),
                                                          // label: waterTotalOfUser.value.round().toString(),
                                                          onChanged: (double value) {
                                                            // setState(() {
                                                            buttWorkoutController.bgAudioValue.value = value;
                                                            buttWorkoutController.setAudioVolume.value =
                                                                buttWorkoutController.bgAudioValue.value.round() / 100;
                                                            //waterTotalOfUser.value = value;
                                                            // });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    ImagesAsset.iconBgmBig,
                                                    color: ColorRes.greenColor,
                                                    scale: 3,
                                                  ),
                                                ],
                                              ),
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
                                                      child: Text("CANCEL", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                      child: ElevatedButton(
                                                    onPressed: () async {
                                                      ///
                                                      // storeWaterTotalOfUser.value = waterCountController.waterDrunkOfUserStore.value;
                                                      // await SharedPreferencesConst.setChangeWaterTotalOfUser(storeWaterTotalOfUser.value);
                                                      // waterTotalOfUser.value = storeWaterTotalOfUser.value;
                                                      if (buttWorkoutController.isBGVoiceOn.value) {
                                                        await buttWorkoutController.player!.setAsset(
                                                          'assets/music_file/fitness_bgm.mp3',
                                                        );
                                                        buttWorkoutController.player!.play();
                                                        buttWorkoutController.player!.setVolume(buttWorkoutController.setAudioVolume.value);
                                                        print('volume value is --->>>${buttWorkoutController.setAudioVolume.value}');
                                                      }else{
                                                        buttWorkoutController.player!.stop();
                                                      }

                                                      Navigator.of(context).pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
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
                              // await buttWorkoutController.player!.setAsset(
                              // 'assets/music_file/fitness_bgm.mp3',);
                              // buttWorkoutController.player!.play();
                            },
                            child: Icon(
                              Icons.more_vert_sharp,
                              color: ColorRes.greyColor,
                              size: 10.w,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 4.w,
                            ),
                            Lottie.asset(
                              buttWorkoutController
                                      .buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.filePath ??
                                  '',
                              width: 60.w,
                              height: 60.w,
                              // fit: BoxFit.fill,
                            ),
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
                                              contentPadding: EdgeInsets.zero,
                                              children: [
                                                Container(
                                                  // height: 90,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        SizedBox(
                                                          height: 2.w,
                                                        ),
                                                        Align(
                                                            alignment: Alignment.topRight,
                                                            child: GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 8.w,
                                                                  color: ColorRes.blackColor.withOpacity(0.5),
                                                                ))),
                                                        Lottie.asset(
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.filePath ??
                                                              '',
                                                          width: 50.w,
                                                          height: 50.w,
                                                          // fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.name ??
                                                              '',
                                                          style:
                                                              const TextStyle(fontSize: 20, color: ColorRes.greenColor, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 3.w,
                                                        ),
                                                        Text(
                                                          buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                                  .exercise?[index].workoutAllDataModel?.introduce ??
                                                              '',
                                                          style: const TextStyle(
                                                              fontSize: 16, color: ColorRes.blackColor, fontWeight: FontWeight.w400, height: 1.5),
                                                        ),
                                                        const SizedBox(height: 20),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.question_mark_outlined,
                                        color: ColorRes.greyColor,
                                      ),
                                    )),
                                Text(
                                  buttWorkoutController
                                          .buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ??
                                      '',
                                  style: const TextStyle(fontSize: 19, color: ColorRes.blackColor, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                ((buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length) ?? 0) > index + 1
                                    ? Text(
                                        'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?[index + 1].workoutAllDataModel?.name ?? ''}',
                                        // 'Next: ${buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForWorkoutStart!) - 1].exercise?[index].workoutAllDataModel?.name ?? ''}',
                                        style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                                      )
                                    : Text(
                                        'After this completed',
                                        style: TextStyle(fontSize: 17, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 6.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  buttWorkoutController.isExerciseChangeIndex.value--;
                                  buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                  buttWorkoutController.customTimerController.pause();
                                  buttWorkoutController.controller1.pause();
                                  buttWorkoutController.isCountDownAnimationHide.value = true;
                                },
                                child: buttWorkoutController.isExerciseChangeIndex.value == 0
                                    ? SizedBox(
                                        width: 10.w,
                                      )
                                    : Icon(
                                        Icons.arrow_back_ios_outlined,
                                        size: 10.w,
                                        color: ColorRes.darkLightGreenColor,
                                      ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  NeonCircularTimer(
                                    width: 30.w,
                                    strokeWidth: 10,
                                    duration:
                                        buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?[index].time ?? 0,
                                    // duration: 5,
                                    isReverse: true,
                                    autoStart: false,
                                    backgroudColor: ColorRes.whiteColor,
                                    innerFillColor: ColorRes.greyColor.withOpacity(0.3),
                                    neonColor: Colors.transparent,
                                    controller: buttWorkoutController.controller1,
                                    isTimerTextShown: false,
                                    neumorphicEffect: true,
                                    innerFillGradient: const LinearGradient(colors: [
                                      ColorRes.greenColor,
                                      ColorRes.darkLightGreenColor,
                                    ]),
                                    onComplete: () {
                                      if (buttWorkoutController.isExerciseChangeIndex.value <
                                          ((buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ?? 0) -
                                              1)) {
                                        // buttWorkoutController.isExerciseChangeIndex.value++;
                                        // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
                                        buttWorkoutController.customTimerController.pause();
                                        buttWorkoutController.controller1.pause();

                                        buttWorkoutController.player!.stop();
                                        Get.to(RestTimeForButtWorkoutScreen(
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value + 1,
                                            exerciseName: buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                    .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImage: buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                .exercise?[index].workoutAllDataModel?.thumbnails));
                                      } else {
                                        Get.toNamed(CongratulationsScreen.routeName);
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          return Get.to(WorkoutCompleteScreen(
                                            dayNumber: widget.dayCountForWorkoutStart,
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            kcalCount: buttWorkoutController.totalListOfKcal[int.parse(widget.dayCountForWorkoutStart!) - 1].toString(),
                                            duration: buttWorkoutController.timeList[int.parse(widget.dayCountForWorkoutStart!) - 1],
                                          ));
                                        });
                                      }
                                    },
                                  ),

                                  ///
                                  GestureDetector(
                                      onTap: () {
                                        buttWorkoutController.isPlayTimer.value = !buttWorkoutController.isPlayTimer.value;
                                        buttWorkoutController.customTimerController.pause();
                                        buttWorkoutController.controller1.pause();
                                        buttWorkoutController.player!.stop();
                                        Get.to(
                                          TakeBreakForButtWorkoutScreen(
                                            exerciseTotalCount:
                                                buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ??
                                                    0,
                                            exerciseNumber: buttWorkoutController.isExerciseChangeIndex.value + 1,
                                            exerciseName: buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                    .exercise?[index].workoutAllDataModel?.name ??
                                                '',
                                            exerciseImage: buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1]
                                                    .exercise?[index].workoutAllDataModel?.thumbnails ??
                                                '',
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.pause,
                                        size: 10.w,
                                        color: ColorRes.darkLightGreenColor,
                                      )),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  buttWorkoutController.isExerciseChangeIndex.value++;
                                  buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);

                                  buttWorkoutController.customTimerController.pause();
                                  buttWorkoutController.controller1.pause();
                                  buttWorkoutController.isCountDownAnimationHide.value = true;
                                },
                                child: buttWorkoutController.isExerciseChangeIndex.value ==
                                        ((buttWorkoutController.buttWorkoutModel1[int.parse(widget.dayCountForWorkoutStart!) - 1].exercise?.length ?? 0) - 1)
                                    ? SizedBox(
                                        width: 10.w,
                                      )
                                    : Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 10.w,
                                        color: ColorRes.darkLightGreenColor,
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: buttWorkoutController.isCountDownAnimationHide.value,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Lottie.asset(
                          'assets/extra/countdown.json', width: 60.w, height: 60.w, repeat: false,
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
