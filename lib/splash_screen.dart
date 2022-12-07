import 'package:befit/screens/home/home_screen.dart';
import 'package:befit/screens/signin_flow/signin_flow_screen.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'utils/color_res.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body:  Center(
      //   child: Image.asset(
      //     'assets/images/stock_info_splash.png',
      //     color: ColorRes.darkBlueColor,
      //     //  fit: BoxFit.fitHeight,
      //     //   height: double.infinity,
      //     //   width: double.infinity,
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            'Be\n\nFit',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9.w,
              color: ColorRes.darkBlueColor,
              letterSpacing: 8.w,
            ),
          ),
        ),
      ),
    );
  }

  data() async {
    await Future.delayed(const Duration(seconds: 3));
    getDataOfStore();
    // Get.toNamed(SignInFlowScreen.routeName);
    // Get.toNamed(HomeScreen.routeName);
  }

  getDataOfStore() {
    heightOfUser.value = SharedPreferencesConst.getsHeightOfUser();
    weightOfUser.value = SharedPreferencesConst.getsWeightOfUser();
    targetWeightOfUser.value = SharedPreferencesConst.getsTargetWeightOfUser();
    if (heightOfUser.value.isEmpty && weightOfUser.value.isEmpty && targetWeightOfUser.value.isEmpty) {
      Get.toNamed(SignInFlowScreen.routeName);
    } else {
      Get.toNamed(HomeScreen.routeName);
    }
  }
}
