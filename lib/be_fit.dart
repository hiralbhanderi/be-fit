import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/signin_flow/signin_flow_controller.dart';
import 'package:befit/screens/signin_flow/signin_flow_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_list_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/abs_workout_start_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/rest_time_for_abs_workout_screen.dart';
import 'package:befit/screens/workout/part/abs_workout/take_break_for_abs_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_list_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/rest_time_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_for_butt_workout_screen.dart';
import 'package:befit/screens/workout/common_screens/warm_up_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_start_screen.dart';
import 'package:befit/splash_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BeFit extends StatelessWidget {
  const BeFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
            home: Container(),
            debugShowCheckedModeBanner: false,
            initialBinding: AppBidding(),
            // title: 'Ser Info',
            initialRoute: SplashScreen.routeName,
            getPages: [
              GetPage(
                name: SplashScreen.routeName,
                page: () => SplashScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: HomeScreen.routeName,
                page: () => HomeScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: ButtWorkoutScreen.routeName,
                page: () => ButtWorkoutScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: ButtWorkoutListScreen.routeName,
                page: () => ButtWorkoutListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: ButtWorkoutStartScreen.routeName,
                page: () => ButtWorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakForButtWorkoutScreen.routeName,
                page: () => TakeBreakForButtWorkoutScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: WarmUpScreen.routeName,
                page: () => WarmUpScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: CongratulationsScreen.routeName,
                page: () => CongratulationsScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: WorkoutCompleteScreen.routeName,
                page: () => WorkoutCompleteScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: AbsWorkoutScreen.routeName,
                page: () => AbsWorkoutScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: AbsWorkoutStartScreen.routeName,
                page: () => AbsWorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: AbsWorkoutCompleteScreen.routeName,
                page: () => AbsWorkoutCompleteScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: AbsWorkoutListScreen.routeName,
                page: () => AbsWorkoutListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakForAbsWorkoutScreen.routeName,
                page: () => TakeBreakForAbsWorkoutScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: SignInFlowScreen.routeName,
                page: () => SignInFlowScreen(),
                transition: Transition.fadeIn,
              ),
            ]);
      },
    );
  }
}

class AppBidding extends Bindings {
  @override
  Future<void> dependencies() async {
    await SharedPreferencesConst.initMySharedPreferences();
    isDayChange.value = SharedPreferencesConst.getsChangeDay();
    // Get.put(PrepareExamController());
  }
}
