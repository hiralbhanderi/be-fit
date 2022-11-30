import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/butt_workout_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/exercise_list_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/take_break_screen.dart';
import 'package:befit/screens/workout/part/butt_workout/workout_start_screen.dart';
import 'package:befit/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QrCodeScan extends StatelessWidget {
  const QrCodeScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
            home: Container(),
            debugShowCheckedModeBanner: false,
            // initialBinding: AppBidding(),
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
            ]);
      },
    );
  }
}
