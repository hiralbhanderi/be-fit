import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class WarmUpScreen extends StatelessWidget {
  static const routeName = '/WarmUpScreen';

  const WarmUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorRes.greenColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Come on!\nLet's warm up!",
                  style: TextStyle(fontSize: 25, color: ColorRes.whiteColor, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Lottie.asset(
                  'assets/prepare/action_prepare.json',
                  width: 110.w,
                  height: 110.w,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
