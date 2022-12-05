import 'package:befit/screens/signin_flow/height_view.dart';
import 'package:befit/screens/signin_flow/workout_type_view.dart';
import 'package:befit/screens/signin_flow/your_weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt selectedIndex = 0.obs;
RxList<Widget> signUpViewsList = [
  WorkoutTypeView(),
  HeightView(),
  YourWeightView(),
  Container(height: 60,color: Colors.green,),
].obs;
PageController pageController = PageController(viewportFraction: 1, keepPage: true);
int ft = 0;

int inches = 0;

String? cm;
RxBool isSelectedWeightLBSType = true.obs;
RxBool isSelectedWeightKGType = false.obs;