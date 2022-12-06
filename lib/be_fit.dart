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
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/full_body_workout_type_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_workout_list_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/plan_advanced_workout_start_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_advanced/take_break_for_plan_advanced_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_workout_list_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/plan_beginner_workout_start_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_beginner/take_break_for_plan_beginner_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_complete_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_workout_list_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/plan_intermediate_workout_start_screen.dart';
import 'package:befit/screens/workout/part/full_body_workout/full_body_workout_types/plan_intermediate/take_break_for_plan_intermediate_screen.dart';
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
              GetPage(
                name: FullBodyWorkoutTypeScreen.routeName,
                page: () => FullBodyWorkoutTypeScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanIntermediateScreen.routeName,
                page: () => PlanIntermediateScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanIntermediateWorkoutListScreen.routeName,
                page: () => PlanIntermediateWorkoutListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanIntermediateWorkoutStartScreen.routeName,
                page: () => PlanIntermediateWorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakForPlanIntermediateScreen.routeName,
                page: () => TakeBreakForPlanIntermediateScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanIntermediateCompleteScreen.routeName,
                page: () => PlanIntermediateCompleteScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanBeginnerCompleteScreen.routeName,
                page: () => PlanBeginnerCompleteScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanBeginnerWorkoutListScreen.routeName,
                page: () => PlanBeginnerWorkoutListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanBeginnerScreen.routeName,
                page: () => PlanBeginnerScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanBeginnerWorkoutStartScreen.routeName,
                page: () => PlanBeginnerWorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakForPlanBeginnerScreen.routeName,
                page: () => TakeBreakForPlanBeginnerScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanAdvancedScreen.routeName,
                page: () => PlanAdvancedScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanAdvancedWorkoutStartScreen.routeName,
                page: () => PlanAdvancedWorkoutStartScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanAdvancedWorkoutListScreen.routeName,
                page: () => PlanAdvancedWorkoutListScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: TakeBreakForPlanAdvancedScreen.routeName,
                page: () => TakeBreakForPlanAdvancedScreen(),
                transition: Transition.fadeIn,
              ),
              GetPage(
                name: PlanAdvancedCompleteScreen.routeName,
                page: () => PlanAdvancedCompleteScreen(),
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
    isDayChangeForButtWorkout.value = SharedPreferencesConst.getsChangeDayForButtWorkout();
    isDayChangeForAbsWorkout.value = SharedPreferencesConst.getsChangeDayForAbsWorkout();
    isDayChangeForPlanIntermediateWorkout.value = SharedPreferencesConst.getsChangeDayForPlanIntermediateWorkout();
    isDayChangeForPlanBeginnerWorkout.value = SharedPreferencesConst.getsChangeDayForPlanBeginnerWorkout();
    isDayChangeForPlanAdvancedWorkout.value = SharedPreferencesConst.getsChangeDayForPlanAdvancedWorkout();
    // Get.put(PrepareExamController());
  }
}
