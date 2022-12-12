import 'package:befit/screens/water_goal/water_conut_controller.dart';
import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class WaterGoalListScreen extends StatefulWidget {
  static const routeName = '/WaterGoalListScreen';
  final int? totalWaterGoal;
  final int? waterDrunkGoal;

  const WaterGoalListScreen({this.totalWaterGoal, this.waterDrunkGoal});

  @override
  State<WaterGoalListScreen> createState() => _WaterGoalListScreenState();
}

class _WaterGoalListScreenState extends State<WaterGoalListScreen> {
  WaterCountController waterCountController = Get.find();

  @override
  void initState() {
    waterCountController.refreshItems();

    super.initState();
  }

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
                    color: ColorRes.blackColor,
                    size: 9.w,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  'Drink Water',
                  style: TextStyle(fontSize: 21, color: ColorRes.blackColor.withOpacity(0.75), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 12.9.w,
                lineWidth: 6,
                animation: true,
                animationDuration: 1500,
                percent: (widget.waterDrunkGoal! / widget.totalWaterGoal!) > 1 ? 1 : widget.waterDrunkGoal! / widget.totalWaterGoal!,
                reverse: true,
                circularStrokeCap: CircularStrokeCap.round,

                center: Text(
                  (widget.waterDrunkGoal! / widget.totalWaterGoal! * 100).round() > 100
                      ? '100%'
                      : '${(widget.waterDrunkGoal! / widget.totalWaterGoal! * 100).round()}%',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.blueColor.withOpacity(0.7)),
                ),
                // circularStrokeCap: CircularStrokeCap.round,
                progressColor: ColorRes.blueColor.withOpacity(0.7),
                backgroundColor: ColorRes.blueColor.withOpacity(0.1),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        (widget.waterDrunkGoal! / widget.totalWaterGoal! * 100).round() > 100
                            ? '${widget.totalWaterGoal!} ml'
                            : '${widget.totalWaterGoal! - widget.waterDrunkGoal!} ml  ',
                        style: TextStyle(fontSize: 24, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        (widget.waterDrunkGoal! / widget.totalWaterGoal! * 100).round() > 100 ? '  today' : '  more',
                        style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Text(
                    (widget.waterDrunkGoal! / widget.totalWaterGoal! * 100).round() > 100 ? 'goal completed' : 'to hit 100%',
                    style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 6.w,
          ),
          Container(
            height: 4,
            color: ColorRes.greyColor.withOpacity(0.4),
          ),
          SizedBox(
            height: 6.w,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(waterCountController.items.length, (index) {
                  final currentItem = waterCountController.items[index];
                  final DateTime now = currentItem['time'];
                  final DateFormat formatter = DateFormat('hh:mm');
                  final String formatted = formatter.format(now);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 6.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ImagesAsset.waterGoalImage,
                            // color: ColorRes.blueColor.withOpacity(0.7),
                            height: 10.w,
                            // fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            formatted,
                            style: TextStyle(fontSize: 18, color: ColorRes.blackColor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${currentItem['mlCount']}ml',
                            style: TextStyle(fontSize: 14, color: ColorRes.blackColor.withOpacity(0.6), fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
