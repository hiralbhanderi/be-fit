import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/congratulation_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/exercise_complete_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/exercise_list_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/rest_time_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/warm_up_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/workout_start_screen.dart';
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
                name: ExerciseListScreen.routeName,
                page: () => ExerciseListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: WorkoutStartScreen.routeName,
                page: () => WorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakScreen.routeName,
                page: () => TakeBreakScreen(),
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
              // GetPage(
              //   name: RestTimeScreen.routeName,
              //   page: () => RestTimeScreen(),
              //   transition: Transition.fadeIn,
              // ),
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
