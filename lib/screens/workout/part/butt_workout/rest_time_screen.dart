// import 'package:befit/screens/workout/part/butt_workout/butt_workout_controller.dart';
// import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
// import 'package:befit/screens/workout/part/butt_workout/congratulation_screen.dart';
// import 'package:befit/screens/workout/part/butt_workout/exercise_complete_screen.dart';
// import 'package:befit/utils/color_res.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:neon_circular_timer/neon_circular_timer.dart';
// import 'package:sizer/sizer.dart';
//
// class RestTimeScreen extends StatelessWidget {
//   static const routeName = '/RestTimeScreen';
//
//   RestTimeScreen({this.exerciseNumber, this.exerciseTotalCount, this.exerciseName, this.exerciseImage, this.dayCountForRestTime});
//
//   final int? exerciseNumber;
//   final int? exerciseTotalCount;
//   final String? exerciseName;
//   final String? exerciseImage;
//   final String? dayCountForRestTime;
//
//   ButtWorkoutController buttWorkoutController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         buttWorkoutController.customTimerController.start();
//         buttWorkoutController.controller1.resume();
//         return true;
//       },
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 70.w,
//               color: ColorRes.greenColor,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 12.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // SizedBox(
//                     //   height: 12.w,
//                     // ),
//                     Text(
//                       'Rest Time',
//                       style: TextStyle(fontSize: 22, color: ColorRes.whiteColor, fontWeight: FontWeight.w500),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // GestureDetector(
//                           //   onTap: () {
//                           //     buttWorkoutController.isExerciseChangeIndex.value--;
//                           //     pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
//                           //   },
//                           //   child: buttWorkoutController.isExerciseChangeIndex.value == 0
//                           //       ? SizedBox(
//                           //     width: 10.w,
//                           //   )
//                           //       : Icon(
//                           //     Icons.arrow_back_ios_outlined,
//                           //     size: 10.w,
//                           //     color: ColorRes.darkLightGreenColor,
//                           //   ),
//                           // ),
//                           NeonCircularTimer(
//                             // width: 200,
//                             width: 30.w,
//
//                             strokeWidth: 5,
//                             duration: 5,
//                             textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 35, color: ColorRes.whiteColor),
//                             isReverse: true,
//                             autoStart: true,
//                             textFormat: TextFormat.S,
//                             backgroudColor: ColorRes.greenColor,
//                             innerFillColor: ColorRes.greyColor.withOpacity(0.3),
//                             neonColor: Colors.transparent,
//                             outerStrokeColor: ColorRes.greenColor,
//                             controller: buttWorkoutController.controller1,
//                             isTimerTextShown: true,
//                             neumorphicEffect: true,
//                             innerFillGradient: const LinearGradient(colors: [
//                               ColorRes.whiteColor,
//                               ColorRes.whiteColor,
//                             ]),
//                             onComplete: () {
//                               // buttWorkoutController.isExerciseChangeIndex.value++;
//                               // buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
//
//                               if (buttWorkoutController.isExerciseChangeIndex.value ==
//                                   buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForRestTime!) - 1].exercise?.length) {
//                                 Get.toNamed(CongratulationsScreen.routeName);
//                                 Future.delayed(const Duration(seconds: 3)).then((value) {
//                                   return Get.to(WorkoutCompleteScreen(
//                                     dayNumber: dayCountForRestTime,
//                                     exerciseTotalCount:
//                                         buttWorkoutController.buttWorkoutModel1[int.parse(dayCountForRestTime!) - 1].exercise?.length ?? 0,
//                                     kcalCount: buttWorkoutController.kcalList[int.parse(dayCountForRestTime!) - 1],
//                                     duration: buttWorkoutController.timeList[int.parse(dayCountForRestTime!) - 1],
//                                   ));
//                                 });
//                                 // buttWorkoutController.isExerciseChangeIndex.value = 0;
//                               }
//                               buttWorkoutController.isExerciseChangeIndex.value++;
//                               buttWorkoutController.pageController.jumpToPage(buttWorkoutController.isExerciseChangeIndex.value);
//                               buttWorkoutController.customTimerController.start();
//                               buttWorkoutController.controller1.resume();
//                               Get.back();
//                             },
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 height: 8.w,
//                                 width: 20.w,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: ColorRes.whiteColor, width: 0.7), borderRadius: BorderRadius.circular(10)),
//                                 child: Center(
//                                   child: Text(
//                                     'skip',
//                                     style: TextStyle(color: ColorRes.whiteColor, fontSize: 18, fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 4.w, right: 4.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'Next: $exerciseNumber/$exerciseTotalCount',
//                         style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.5), fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         height: 5.w,
//                       ),
//                       Text(
//                         '$exerciseName',
//                         style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                   Image.asset(
//                     '$exerciseImage',
//                     scale: 10,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
